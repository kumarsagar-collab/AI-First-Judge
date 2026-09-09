<#
.SYNOPSIS
    Extracts readable text from a workshop submission or knowledge document.

.DESCRIPTION
    Reads DOCX, PPTX, XLSX, TXT, HTML, code files, and legacy DOC/PPT/XLS files
    using PowerShell only (no Python). Detects the real format from the file's magic
    bytes rather than trusting the extension, because files are sometimes saved in
    the legacy Office binary (OLE compound) format under a modern extension.

      - Modern Open XML (ZIP, magic "PK"): parsed directly from the package XML.
          DOCX -> word/document.xml (paragraphs + tables).
          PPTX -> ppt/slides/slideN.xml + ppt/notesSlides/notesSlideN.xml.
          XLSX -> xl/sharedStrings.xml + xl/worksheets/sheetN.xml (rows as cells).
      - Legacy binary (OLE, magic D0 CF 11 E0): read via Office COM automation
          (Word / PowerPoint / Excel). Requires Office installed. A single retry
          recovers from transient COM/RPC failures (e.g. 0x800706B5).
      - TXT / HTML / code / SVG / CSV: read as-is (text-based, evaluated verbatim).
      - Raster images (PNG/JPG/GIF/WEBP/BMP): not text-extractable; emit a marker
          so the evaluator views them with a multimodal viewer or marks them
          Not evidenced.

    Output is plain UTF-8 text with lightweight structure markers so an evaluator
    can cite evidence locations (paragraphs, table rows, slide numbers, sheet rows).

.PARAMETER Path
    One or more file paths to extract. Accepts a single path or an array.

.PARAMETER Directory
    A folder whose accepted files are all extracted in a single process. Use this for
    a team folder so every artefact (DOCX/PPTX/HTML/code/image) is read in one pass
    instead of one PowerShell/COM start-up per file.

.PARAMETER Recurse
    Recurse into subfolders when -Directory is used.

.EXAMPLE
    ./Extract-SubmissionText.ps1 -Path 'C:\code\AI-First Proposal Judge\WorkShopSubmission\Team A\proposal.docx'

.EXAMPLE
    # Extract an entire team folder (all accepted files) in one fast pass:
    ./Extract-SubmissionText.ps1 -Directory 'C:\code\AI-First Proposal Judge\WorkShopSubmission\Team A' -Recurse
#>
[CmdletBinding()]
param(
    # One or more file paths to extract. Accepts a single path or an array.
    [string[]]$Path,
    # Extract every accepted file inside this folder in ONE process (fast path for a team folder).
    [string]$Directory,
    # Recurse into subfolders when -Directory is used.
    [switch]$Recurse
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Text-based code, markup, and wireframe formats read verbatim.
$script:CodeExtensions = @(
    '.txt', '.md', '.html', '.htm', '.css', '.scss', '.js', '.mjs', '.cjs',
    '.ts', '.tsx', '.jsx', '.vue', '.svelte', '.razor', '.cshtml', '.json',
    '.py', '.cs', '.java', '.go', '.rb', '.php', '.sql', '.yaml', '.yml',
    '.xml', '.svg', '.sh', '.ps1', '.csv'
)
$script:ImageExtensions = @('.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp')
$script:OfficeExtensions = @('.docx', '.doc', '.pptx', '.ppt', '.xlsx', '.xls')

# Reused COM instances so a batch of legacy Office files opens one app, not one per file.
$script:WordApp = $null
$script:PptApp = $null
$script:ExcelApp = $null

function Get-WordApp {
    if (-not $script:WordApp) {
        $script:WordApp = New-Object -ComObject Word.Application
        $script:WordApp.Visible = $false
        $script:WordApp.DisplayAlerts = 0
    }
    return $script:WordApp
}

function Get-PptApp {
    if (-not $script:PptApp) {
        $script:PptApp = New-Object -ComObject PowerPoint.Application
    }
    return $script:PptApp
}

function Get-ExcelApp {
    if (-not $script:ExcelApp) {
        $script:ExcelApp = New-Object -ComObject Excel.Application
        $script:ExcelApp.Visible = $false
        $script:ExcelApp.DisplayAlerts = $false
    }
    return $script:ExcelApp
}

# Drop one cached COM app so the next Get-*App call starts a fresh instance. Used to
# recover from transient COM/RPC failures (e.g. 0x800706B5) with a single retry.
function Reset-ComApp {
    param([ValidateSet('Word', 'Ppt', 'Excel')][string]$Which)
    switch ($Which) {
        'Word'  { if ($script:WordApp)  { try { $script:WordApp.Quit()  | Out-Null } catch { }; [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:WordApp);  $script:WordApp = $null } }
        'Ppt'   { if ($script:PptApp)   { try { $script:PptApp.Quit()   | Out-Null } catch { }; [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:PptApp);   $script:PptApp = $null } }
        'Excel' { if ($script:ExcelApp) { try { $script:ExcelApp.Quit() | Out-Null } catch { }; [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:ExcelApp); $script:ExcelApp = $null } }
    }
}

function Close-ComApps {
    if ($script:WordApp) {
        try { $script:WordApp.Quit() | Out-Null } catch { }
        [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:WordApp)
        $script:WordApp = $null
    }
    if ($script:PptApp) {
        try { $script:PptApp.Quit() | Out-Null } catch { }
        [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:PptApp)
        $script:PptApp = $null
    }
    if ($script:ExcelApp) {
        try { $script:ExcelApp.Quit() | Out-Null } catch { }
        [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($script:ExcelApp)
        $script:ExcelApp = $null
    }
}

function Get-FileSignature {
    param([string]$FilePath)
    $stream = [System.IO.File]::OpenRead($FilePath)
    try {
        $buffer = New-Object byte[] 8
        $read = $stream.Read($buffer, 0, 8)
        return ($buffer[0..([Math]::Max(0, $read - 1))] | ForEach-Object { $_.ToString('X2') }) -join '-'
    }
    finally { $stream.Dispose() }
}

function Convert-XmlEntity {
    param([string]$Text)
    if ([string]::IsNullOrEmpty($Text)) { return '' }
    return ($Text -replace '&lt;', '<' -replace '&gt;', '>' `
                  -replace '&quot;', '"' -replace '&apos;', "'" -replace '&amp;', '&')
}

function Convert-XmlToText {
    param([string]$Xml)
    if ([string]::IsNullOrWhiteSpace($Xml)) { return '' }
    $text = $Xml
    $text = [regex]::Replace($text, '<w:tab[^>]*/>', "`t")
    $text = [regex]::Replace($text, '<w:br[^>]*/>', "`n")
    $text = [regex]::Replace($text, '</w:p>', "`n")
    $text = [regex]::Replace($text, '</w:tr>', "`n")
    $text = [regex]::Replace($text, '</w:tc>', " | ")
    $text = [regex]::Replace($text, '</a:p>', "`n")
    $text = [regex]::Replace($text, '<[^>]+>', '')
    $text = $text -replace '&lt;', '<' -replace '&gt;', '>' `
                  -replace '&quot;', '"' -replace '&apos;', "'" -replace '&amp;', '&'
    $text = [regex]::Replace($text, '(\r?\n\s*){3,}', "`n`n")
    return $text.Trim()
}

function Get-ZipEntryText {
    param([System.IO.Compression.ZipArchive]$Archive, [string]$EntryName)
    $entry = $Archive.GetEntry($EntryName)
    if ($null -eq $entry) { return '' }
    $reader = New-Object System.IO.StreamReader($entry.Open())
    try { return $reader.ReadToEnd() } finally { $reader.Dispose() }
}

function Convert-OoxmlDocx {
    param([string]$FilePath)
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($FilePath)
    try {
        $documentXml = Get-ZipEntryText -Archive $zip -EntryName 'word/document.xml'
        if ([string]::IsNullOrWhiteSpace($documentXml)) {
            Write-Output "===== CONTENT UNAVAILABLE: word/document.xml not readable ====="
            return
        }
        $body = Convert-XmlToText -Xml $documentXml
        $lineCount = ($body -split "`n").Count
        Write-Output "===== SECTIONS DETECTED: $lineCount body lines (paragraphs/table rows) ====="
        Write-Output $body
    }
    finally { $zip.Dispose() }
}

function Convert-OoxmlPptx {
    param([string]$FilePath)
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($FilePath)
    try {
        $slideEntries = $zip.Entries |
            Where-Object { $_.FullName -match '^ppt/slides/slide\d+\.xml$' } |
            Sort-Object { [int]([regex]::Match($_.FullName, '\d+').Value) }
        Write-Output "===== SECTIONS DETECTED: $($slideEntries.Count) slides ====="
        $slideNumber = 0
        foreach ($slide in $slideEntries) {
            $slideNumber++
            $slideText = Convert-XmlToText -Xml (Get-ZipEntryText -Archive $zip -EntryName $slide.FullName)
            $notesText = Convert-XmlToText -Xml (Get-ZipEntryText -Archive $zip -EntryName "ppt/notesSlides/notesSlide$slideNumber.xml")
            Write-Output ''
            Write-Output "----- SLIDE $slideNumber -----"
            if (-not [string]::IsNullOrWhiteSpace($slideText)) { Write-Output $slideText }
            else { Write-Output "[No readable text on this slide. Any evidence in graphics/diagrams is Not evidenced.]" }
            if (-not [string]::IsNullOrWhiteSpace($notesText)) { Write-Output "  [Speaker notes] $notesText" }
        }
    }
    finally { $zip.Dispose() }
}

function Convert-LegacyDoc {
    param([string]$FilePath)
    for ($attempt = 1; $attempt -le 2; $attempt++) {
        $doc = $null
        try {
            $word = Get-WordApp
            $doc = $word.Documents.Open($FilePath, $false, $true)  # ConfirmConversions=false, ReadOnly=true
            $text = $doc.Content.Text
            Write-Output "===== SECTIONS DETECTED: legacy Word document (COM extraction) ====="
            Write-Output ($text -replace "`r", "`n")
            return
        }
        catch {
            if ($doc) { try { $doc.Close($false) | Out-Null } catch { } }
            if ($attempt -eq 1) { Reset-ComApp -Which Word; continue }
            Write-Output "===== CONTENT UNAVAILABLE: legacy Word file and Word COM automation failed: $($_.Exception.Message) ====="
        }
        finally {
            if ($doc) { try { $doc.Close($false) | Out-Null } catch { } }
        }
    }
}

function Convert-LegacyPpt {
    param([string]$FilePath)
    for ($attempt = 1; $attempt -le 2; $attempt++) {
        $pres = $null
        try {
            $ppt = Get-PptApp
            $pres = $ppt.Presentations.Open($FilePath, $true, $false, $false)  # ReadOnly, Untitled, WithWindow=false
            Write-Output "===== SECTIONS DETECTED: $($pres.Slides.Count) slides (legacy PowerPoint, COM extraction) ====="
            foreach ($slide in $pres.Slides) {
                Write-Output ''
                Write-Output "----- SLIDE $($slide.SlideNumber) -----"
                foreach ($shape in $slide.Shapes) {
                    if ($shape.HasTextFrame -and $shape.TextFrame.HasText) {
                        Write-Output $shape.TextFrame.TextRange.Text
                    }
                }
                if ($slide.HasNotesPage) {
                    foreach ($shape in $slide.NotesPage.Shapes) {
                        if ($shape.HasTextFrame -and $shape.TextFrame.HasText -and $shape.TextFrame.TextRange.Text.Trim()) {
                            Write-Output "  [Speaker notes] $($shape.TextFrame.TextRange.Text)"
                        }
                    }
                }
            }
            if ($pres) { try { $pres.Close() | Out-Null } catch { } }
            return
        }
        catch {
            if ($pres) { try { $pres.Close() | Out-Null } catch { } }
            if ($attempt -eq 1) { Reset-ComApp -Which Ppt; continue }
            Write-Output "===== CONTENT UNAVAILABLE: legacy PowerPoint file and PowerPoint COM automation failed: $($_.Exception.Message) ====="
        }
    }
}

function Convert-OoxmlXlsx {
    param([string]$FilePath)
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($FilePath)
    try {
        # Shared strings table: cells with t="s" reference these by index.
        $shared = New-Object System.Collections.Generic.List[string]
        $ssXml = Get-ZipEntryText -Archive $zip -EntryName 'xl/sharedStrings.xml'
        if (-not [string]::IsNullOrWhiteSpace($ssXml)) {
            foreach ($si in [regex]::Matches($ssXml, '<si>(.*?)</si>', 'Singleline')) {
                $parts = [regex]::Matches($si.Groups[1].Value, '<t[^>]*>(.*?)</t>', 'Singleline') | ForEach-Object { $_.Groups[1].Value }
                $shared.Add((Convert-XmlEntity -Text (($parts -join ''))))
            }
        }
        $sheetEntries = $zip.Entries |
            Where-Object { $_.FullName -match '^xl/worksheets/sheet\d+\.xml$' } |
            Sort-Object { [int]([regex]::Match($_.FullName, '\d+').Value) }
        Write-Output "===== SECTIONS DETECTED: $($sheetEntries.Count) worksheet(s) (cite by sheet and row) ====="
        $sheetNumber = 0
        foreach ($sheet in $sheetEntries) {
            $sheetNumber++
            Write-Output ''
            Write-Output "----- SHEET $sheetNumber -----"
            $sheetXml = Get-ZipEntryText -Archive $zip -EntryName $sheet.FullName
            foreach ($rowMatch in [regex]::Matches($sheetXml, '<row[^>]*>(.*?)</row>', 'Singleline')) {
                $cells = New-Object System.Collections.Generic.List[string]
                foreach ($cellMatch in [regex]::Matches($rowMatch.Groups[1].Value, '<c\b(?<attrs>[^>]*)>(?<body>.*?)</c>', 'Singleline')) {
                    $type = [regex]::Match($cellMatch.Groups['attrs'].Value, 't="(?<t>[^"]+)"').Groups['t'].Value
                    $body = $cellMatch.Groups['body'].Value
                    $value = ''
                    if ($type -eq 's') {
                        $idx = [regex]::Match($body, '<v>(?<v>.*?)</v>', 'Singleline').Groups['v'].Value
                        if ($idx -match '^\d+$' -and [int]$idx -lt $shared.Count) { $value = $shared[[int]$idx] }
                    }
                    elseif ($type -eq 'inlineStr') {
                        $inline = [regex]::Matches($body, '<t[^>]*>(.*?)</t>', 'Singleline') | ForEach-Object { $_.Groups[1].Value }
                        $value = Convert-XmlEntity -Text (($inline -join ''))
                    }
                    else {
                        $value = Convert-XmlEntity -Text ([regex]::Match($body, '<v>(?<v>.*?)</v>', 'Singleline').Groups['v'].Value)
                    }
                    $cells.Add($value)
                }
                $line = ($cells -join ' | ').Trim()
                if (-not [string]::IsNullOrWhiteSpace(($line -replace '\|', '').Trim())) { Write-Output $line }
            }
        }
    }
    finally { $zip.Dispose() }
}

function Convert-LegacyXls {
    param([string]$FilePath)
    for ($attempt = 1; $attempt -le 2; $attempt++) {
        $wb = $null
        try {
            $excel = Get-ExcelApp
            $wb = $excel.Workbooks.Open($FilePath, 0, $true)  # UpdateLinks=0, ReadOnly=true
            Write-Output "===== SECTIONS DETECTED: $($wb.Worksheets.Count) worksheet(s) (legacy Excel, COM extraction) ====="
            foreach ($ws in $wb.Worksheets) {
                Write-Output ''
                Write-Output "----- SHEET $($ws.Name) -----"
                $used = $ws.UsedRange
                $data = $used.Value2
                $rowCount = $used.Rows.Count
                $colCount = $used.Columns.Count
                if ($rowCount -le 1 -and $colCount -le 1) {
                    if ($data) { Write-Output "$data" }
                }
                else {
                    for ($r = 1; $r -le $rowCount; $r++) {
                        $rowCells = for ($c = 1; $c -le $colCount; $c++) { "$($data[$r, $c])" }
                        $line = ($rowCells -join ' | ').Trim()
                        if (-not [string]::IsNullOrWhiteSpace(($line -replace '\|', '').Trim())) { Write-Output $line }
                    }
                }
            }
            if ($wb) { try { $wb.Close($false) | Out-Null } catch { } }
            return
        }
        catch {
            if ($wb) { try { $wb.Close($false) | Out-Null } catch { } }
            if ($attempt -eq 1) { Reset-ComApp -Which Excel; continue }
            Write-Output "===== CONTENT UNAVAILABLE: Excel file and Excel COM automation failed: $($_.Exception.Message) ====="
        }
    }
}

function Write-TextLikeFile {
    param([string]$FilePath, [string]$Kind)
    $content = Get-Content -LiteralPath $FilePath -Raw -Encoding UTF8
    if ($null -eq $content) { $content = '' }
    $lineCount = ($content -split "`n").Count
    Write-Output "===== SECTIONS DETECTED: $Kind, $lineCount lines (cite by line number) ====="
    Write-Output $content
}

function Write-ImageMarker {
    param([string]$FilePath)
    Write-Output "===== IMAGE SUBMISSION: content is not text-extractable by this script ====="
    Write-Output "===== ACTION: view this image with a multimodal viewer to read the wireframe/diagram. If multimodal viewing is unavailable, mark it Not evidenced and request a text/HTML alternative or an accessible description. ====="
    Write-Output "IMAGE_PATH: $FilePath"
}

function Invoke-ExtractOneFile {
    param([string]$FilePath)

    $item = Get-Item -LiteralPath $FilePath
    $fullPath = $item.FullName
    $extension = $item.Extension.ToLowerInvariant()
    $signature = Get-FileSignature -FilePath $fullPath
    $isZip = $signature.StartsWith('50-4B')          # "PK" -> Open XML package
    $isOle = $signature.StartsWith('D0-CF-11-E0')    # OLE compound -> legacy Office binary

    Write-Output "===== FILE: $($item.Name) ====="
    Write-Output "===== TYPE: $extension (signature $signature) ====="

    switch ($extension) {
        '.docx' { if ($isZip) { Convert-OoxmlDocx -FilePath $fullPath } else { Convert-LegacyDoc -FilePath $fullPath } }
        '.doc'  { Convert-LegacyDoc -FilePath $fullPath }
        '.pptx' { if ($isZip) { Convert-OoxmlPptx -FilePath $fullPath } else { Convert-LegacyPpt -FilePath $fullPath } }
        '.ppt'  { Convert-LegacyPpt -FilePath $fullPath }
        '.xlsx' { if ($isZip) { Convert-OoxmlXlsx -FilePath $fullPath } else { Convert-LegacyXls -FilePath $fullPath } }
        '.xls'  { Convert-LegacyXls -FilePath $fullPath }
        default {
            if ($script:CodeExtensions -contains $extension) {
                $kind = if ($extension -in @('.html', '.htm')) { "HTML wireframe/markup" }
                        elseif ($extension -in @('.txt', '.md')) { "plain text" }
                        elseif ($extension -eq '.csv') { "CSV data (cite by row)" }
                        elseif ($extension -eq '.svg') { "SVG wireframe (XML text)" }
                        else { "code ($extension)" }
                Write-TextLikeFile -FilePath $fullPath -Kind $kind
            }
            elseif ($script:ImageExtensions -contains $extension) { Write-ImageMarker -FilePath $fullPath }
            elseif ($isZip)  { Write-Output "===== CONTENT UNAVAILABLE: unknown extension but ZIP package. Rename to .docx, .pptx, or .xlsx. =====" }
            elseif ($isOle)  { Write-Output "===== CONTENT UNAVAILABLE: unknown extension but legacy Office binary. Rename to .doc, .ppt, or .xls. =====" }
            else             { Write-Output "===== CONTENT UNAVAILABLE: unsupported file type '$extension'. Accept Office docs, spreadsheets, text, HTML, code, SVG, or raster images. =====" }
        }
    }
}

# Resolve the set of files to extract from -Directory and/or -Path. Extracting a whole
# team folder in one process avoids per-file PowerShell/COM startup cost.
$acceptedAll = $script:CodeExtensions + $script:ImageExtensions + $script:OfficeExtensions
$targets = [System.Collections.Generic.List[string]]::new()

if ($Directory) {
    if (-not (Test-Path -LiteralPath $Directory)) { Write-Error "Directory not found: $Directory"; exit 1 }
    $gci = @{ LiteralPath = $Directory; File = $true }
    if ($Recurse) { $gci['Recurse'] = $true }
    Get-ChildItem @gci |
        Where-Object { $acceptedAll -contains $_.Extension.ToLowerInvariant() } |
        Sort-Object FullName |
        ForEach-Object { $targets.Add($_.FullName) }
}

foreach ($p in $Path) { if (-not [string]::IsNullOrWhiteSpace($p)) { $targets.Add($p) } }

if ($targets.Count -eq 0) {
    Write-Error "No files to extract. Provide -Path <file[,file]> and/or -Directory <folder>."
    exit 1
}

try {
    $first = $true
    foreach ($target in $targets) {
        if (-not $first) { Write-Output '' }
        $first = $false
        if (-not (Test-Path -LiteralPath $target)) {
            Write-Output "===== FILE: $target ====="
            Write-Output "===== CONTENT UNAVAILABLE: file not found ====="
            continue
        }
        Invoke-ExtractOneFile -FilePath $target
    }
}
finally {
    Close-ComApps
}
