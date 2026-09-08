<#
.SYNOPSIS
    Extracts readable text from a workshop submission or knowledge document.

.DESCRIPTION
    Reads DOCX, PPTX, TXT, HTML, code files, and legacy DOC/PPT files using
    PowerShell only (no Python). Detects the real format from the file's magic
    bytes rather than trusting the extension, because files are sometimes saved in
    the legacy Office binary (OLE compound) format under a modern extension.

      - Modern Open XML (ZIP, magic "PK"): parsed directly from the package XML.
          DOCX -> word/document.xml (paragraphs + tables).
          PPTX -> ppt/slides/slideN.xml + ppt/notesSlides/notesSlideN.xml.
      - Legacy binary (OLE, magic D0 CF 11 E0): read via Office COM automation
          (Word.Application / PowerPoint.Application). Requires Office installed.
      - TXT / HTML / code / SVG: read as-is (text-based, evaluated verbatim).
      - Raster images (PNG/JPG/GIF/WEBP/BMP): not text-extractable; emit a marker
          so the evaluator views them with a multimodal viewer or marks them
          Not evidenced.

    Output is plain UTF-8 text with lightweight structure markers so an evaluator
    can cite evidence locations (paragraphs, table rows, slide numbers).

.PARAMETER Path
    Full path to the submission or knowledge file.

.EXAMPLE
    ./Extract-SubmissionText.ps1 -Path 'C:\code\AI-First Proposal Judge\WorkShopSubmission\TeamA.docx'
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Path
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

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
    $word = $null; $doc = $null
    try {
        $word = New-Object -ComObject Word.Application
        $word.Visible = $false
        $word.DisplayAlerts = 0
        $doc = $word.Documents.Open($FilePath, $false, $true)  # ConfirmConversions=false, ReadOnly=true
        $text = $doc.Content.Text
        Write-Output "===== SECTIONS DETECTED: legacy Word document (COM extraction) ====="
        Write-Output ($text -replace "`r", "`n")
    }
    catch {
        Write-Output "===== CONTENT UNAVAILABLE: legacy Word file and Word COM automation failed: $($_.Exception.Message) ====="
    }
    finally {
        if ($doc)  { $doc.Close($false) | Out-Null }
        if ($word) { $word.Quit() | Out-Null; [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($word) }
    }
}

function Convert-LegacyPpt {
    param([string]$FilePath)
    $ppt = $null; $pres = $null
    try {
        $ppt = New-Object -ComObject PowerPoint.Application
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
    }
    catch {
        Write-Output "===== CONTENT UNAVAILABLE: legacy PowerPoint file and PowerPoint COM automation failed: $($_.Exception.Message) ====="
    }
    finally {
        if ($pres) { $pres.Close() | Out-Null }
        if ($ppt)  { $ppt.Quit() | Out-Null; [void][System.Runtime.InteropServices.Marshal]::ReleaseComObject($ppt) }
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

if (-not (Test-Path -LiteralPath $Path)) {
    Write-Error "File not found: $Path"
    exit 1
}

$item = Get-Item -LiteralPath $Path
$fullPath = $item.FullName
$extension = $item.Extension.ToLowerInvariant()
$signature = Get-FileSignature -FilePath $fullPath
$isZip = $signature.StartsWith('50-4B')          # "PK" -> Open XML package
$isOle = $signature.StartsWith('D0-CF-11-E0')    # OLE compound -> legacy Office binary

# Text-based code, markup, and wireframe formats read verbatim.
$codeExtensions = @(
    '.txt', '.md', '.html', '.htm', '.css', '.scss', '.js', '.mjs', '.cjs',
    '.ts', '.tsx', '.jsx', '.vue', '.svelte', '.razor', '.cshtml', '.json',
    '.py', '.cs', '.java', '.go', '.rb', '.php', '.sql', '.yaml', '.yml',
    '.xml', '.svg', '.sh', '.ps1'
)
$imageExtensions = @('.png', '.jpg', '.jpeg', '.gif', '.bmp', '.webp')

Write-Output "===== FILE: $($item.Name) ====="
Write-Output "===== TYPE: $extension (signature $signature) ====="

switch ($extension) {
    '.docx' { if ($isZip) { Convert-OoxmlDocx -FilePath $fullPath } else { Convert-LegacyDoc -FilePath $fullPath } }
    '.doc'  { Convert-LegacyDoc -FilePath $fullPath }
    '.pptx' { if ($isZip) { Convert-OoxmlPptx -FilePath $fullPath } else { Convert-LegacyPpt -FilePath $fullPath } }
    '.ppt'  { Convert-LegacyPpt -FilePath $fullPath }
    default {
        if ($codeExtensions -contains $extension) {
            $kind = if ($extension -in @('.html', '.htm')) { "HTML wireframe/markup" }
                    elseif ($extension -in @('.txt', '.md')) { "plain text" }
                    elseif ($extension -eq '.svg') { "SVG wireframe (XML text)" }
                    else { "code ($extension)" }
            Write-TextLikeFile -FilePath $fullPath -Kind $kind
        }
        elseif ($imageExtensions -contains $extension) { Write-ImageMarker -FilePath $fullPath }
        elseif ($isZip)  { Write-Output "===== CONTENT UNAVAILABLE: unknown extension but ZIP package. Rename to .docx or .pptx. =====" }
        elseif ($isOle)  { Write-Output "===== CONTENT UNAVAILABLE: unknown extension but legacy Office binary. Rename to .doc or .ppt. =====" }
        else             { Write-Output "===== CONTENT UNAVAILABLE: unsupported file type '$extension'. Accept Office docs, text, HTML, code, SVG, or raster images. =====" }
    }
}
