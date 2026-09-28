<#
.SYNOPSIS
    Extracts readable text from a workshop submission or knowledge document.

.DESCRIPTION
    Reads DOCX, PPTX, XLSX, TXT, HTML, code files, and legacy DOC/PPT/XLS files
    using PowerShell only (no Python). Detects the real format from the file's magic
    bytes rather than trusting the extension, because files are sometimes saved in
    the legacy Office binary (OLE compound) format under a modern extension.

      - Modern Open XML (ZIP, magic "PK"): parsed directly from the package XML.
          DOCX -> word/document.xml (paragraphs + tables) + any word/charts.
          PPTX -> slides in true presentation order; speaker notes, charts, and
                  SmartArt are resolved per-slide via each slide's relationships
                  (notes are attributed to the correct slide, not by position).
          XLSX -> xl/sharedStrings.xml + worksheets in workbook order with their real
                  sheet names; date serials render as ISO dates and percentage cells
                  as NN% using xl/styles.xml number formats.
      - Chart data (ppt/charts, word/charts, DrawingML tables) is surfaced from the
          cached series/category values so evidence held only in a graph is not lost.
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
$script:PdfExtensions = @('.pdf')

# Reused COM instances so a batch of legacy Office files opens one app, not one per file.
$script:WordApp = $null
$script:PptApp = $null
$script:ExcelApp = $null

# Cache whether each Office COM app is even registered on this machine. Checking the
# ProgID is instant; without it a missing Office would cost a slow launch-fail-retry.
$script:ComAvailability = @{}
function Test-ComAvailable {
    param([string]$ProgId)
    if (-not $script:ComAvailability.ContainsKey($ProgId)) {
        $script:ComAvailability[$ProgId] = [bool][Type]::GetTypeFromProgID($ProgId)
    }
    return $script:ComAvailability[$ProgId]
}

function Get-WordApp {
    if (-not $script:WordApp) {
        $script:WordApp = New-Object -ComObject Word.Application
        $script:WordApp.Visible = $false
        $script:WordApp.DisplayAlerts = 0
        # Suppress macro/security prompts and link-update dialogs that would otherwise
        # block COM automation on an untrusted submission (msoAutomationSecurityForceDisable = 3).
        try { $script:WordApp.AutomationSecurity = 3 } catch { }
        try { $script:WordApp.Options.ConfirmConversions = $false } catch { }
    }
    return $script:WordApp
}

function Get-PptApp {
    if (-not $script:PptApp) {
        $script:PptApp = New-Object -ComObject PowerPoint.Application
        # PowerPoint has no Visible=$false for automation, but alerts and macro prompts
        # must be silenced so a bad deck cannot pop a modal dialog and hang the run.
        try { $script:PptApp.DisplayAlerts = 1 } catch { }          # ppAlertsNone
        try { $script:PptApp.AutomationSecurity = 3 } catch { }      # ForceDisable macros
    }
    return $script:PptApp
}

function Get-ExcelApp {
    if (-not $script:ExcelApp) {
        $script:ExcelApp = New-Object -ComObject Excel.Application
        $script:ExcelApp.Visible = $false
        $script:ExcelApp.DisplayAlerts = $false
        try { $script:ExcelApp.AutomationSecurity = 3 } catch { }    # ForceDisable macros
        try { $script:ExcelApp.AskToUpdateLinks = $false } catch { } # no link-update prompt
        try { $script:ExcelApp.EnableEvents = $false } catch { }     # no workbook_open macros
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
    # Drop table-style GUIDs (DrawingML <a:tableStyleId>{...}) so they don't leak into text.
    $text = [regex]::Replace($text, '<a:tableStyleId>.*?</a:tableStyleId>', '', 'Singleline')
    $text = [regex]::Replace($text, '<w:tab[^>]*/>', "`t")
    $text = [regex]::Replace($text, '<w:br[^>]*/>', "`n")
    $text = [regex]::Replace($text, '</w:p>', "`n")
    $text = [regex]::Replace($text, '</a:p>', "`n")
    # Table cells and rows: WordprocessingML (<w:tc>/<w:tr>, DOCX) and DrawingML
    # (<a:tc>/<a:tr>, PPTX slide tables). Cells become " | ", rows become newlines.
    $text = [regex]::Replace($text, '</w:tc>', " | ")
    $text = [regex]::Replace($text, '</a:tc>', " | ")
    $text = [regex]::Replace($text, '</w:tr>', "`n")
    $text = [regex]::Replace($text, '</a:tr>', "`n")
    $text = [regex]::Replace($text, '<[^>]+>', '')
    $text = $text -replace '&lt;', '<' -replace '&gt;', '>' `
                  -replace '&quot;', '"' -replace '&apos;', "'" -replace '&amp;', '&'
    # Clean cell layout: a paragraph break placed right before a cell delimiter, and a
    # trailing delimiter right before a row break, are structural noise from the tags above.
    $text = [regex]::Replace($text, '[ \t]*\r?\n\s*\|', ' |')
    $text = [regex]::Replace($text, '\|[ \t]*(\r?\n)', '$1')
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

# Resolve an OOXML relationship Target (which is relative to the .rels part's owning
# folder) into a full in-package path, e.g. base 'ppt/slides' + '../charts/chart1.xml'
# -> 'ppt/charts/chart1.xml'. Absolute '/...' targets are returned package-rooted.
function Resolve-ZipPath {
    param([string]$BaseDir, [string]$Target)
    if ([string]::IsNullOrWhiteSpace($Target)) { return '' }
    if ($Target.StartsWith('/')) { return $Target.TrimStart('/') }
    $parts = [System.Collections.Generic.List[string]]::new()
    foreach ($seg in ($BaseDir.TrimEnd('/') -split '/')) { if ($seg -ne '') { $parts.Add($seg) } }
    foreach ($seg in ($Target -split '/')) {
        if ($seg -eq '..') { if ($parts.Count -gt 0) { $parts.RemoveAt($parts.Count - 1) } }
        elseif ($seg -eq '.' -or $seg -eq '') { }
        else { $parts.Add($seg) }
    }
    return ($parts -join '/')
}

# Parse an OOXML .rels part into resolved relationships. Skips external targets.
function Get-OoxmlRels {
    param([System.IO.Compression.ZipArchive]$Archive, [string]$RelsEntryName, [string]$BaseDir)
    $rels = [System.Collections.Generic.List[object]]::new()
    $xml = Get-ZipEntryText -Archive $Archive -EntryName $RelsEntryName
    if ([string]::IsNullOrWhiteSpace($xml)) { return $rels }
    foreach ($m in [regex]::Matches($xml, '<Relationship\b[^>]*?/>')) {
        $r = $m.Value
        if ([regex]::Match($r, 'TargetMode="External"').Success) { continue }
        $id = [regex]::Match($r, 'Id="([^"]+)"').Groups[1].Value
        $type = [regex]::Match($r, 'Type="([^"]+)"').Groups[1].Value
        $target = Convert-XmlEntity -Text ([regex]::Match($r, 'Target="([^"]*)"').Groups[1].Value)
        $rels.Add([pscustomobject]@{ Id = $id; Type = $type; Target = (Resolve-ZipPath -BaseDir $BaseDir -Target $target) })
    }
    return $rels
}

# True slide order from ppt/presentation.xml (<p:sldIdLst>), resolved via the
# presentation rels. Falls back to filename numeric order when unavailable.
function Get-PptxSlideOrder {
    param([System.IO.Compression.ZipArchive]$Archive)
    $order = [System.Collections.Generic.List[string]]::new()
    $presXml = Get-ZipEntryText -Archive $Archive -EntryName 'ppt/presentation.xml'
    if (-not [string]::IsNullOrWhiteSpace($presXml)) {
        $relMap = @{}
        foreach ($r in (Get-OoxmlRels -Archive $Archive -RelsEntryName 'ppt/_rels/presentation.xml.rels' -BaseDir 'ppt')) { $relMap[$r.Id] = $r.Target }
        $lst = [regex]::Match($presXml, '<p:sldIdLst>(.*?)</p:sldIdLst>', 'Singleline')
        if ($lst.Success) {
            foreach ($m in [regex]::Matches($lst.Groups[1].Value, '<p:sldId\b[^>]*?/>')) {
                $rid = [regex]::Match($m.Value, 'r:id="([^"]+)"').Groups[1].Value
                if ($rid -and $relMap.ContainsKey($rid)) { $order.Add($relMap[$rid]) }
            }
        }
    }
    if ($order.Count -eq 0) {
        $Archive.Entries |
            Where-Object { $_.FullName -match '^ppt/slides/slide\d+\.xml$' } |
            Sort-Object { [int]([regex]::Match($_.FullName, '\d+').Value) } |
            ForEach-Object { $order.Add($_.FullName) }
    }
    return , $order
}

# Extract readable numbers/labels from a chart part's cached values so evidence held
# only in a graph is not lost. Emits a title line plus one line per data series.
function Get-OoxmlChartText {
    param([System.IO.Compression.ZipArchive]$Archive, [string]$ChartEntry)
    $lines = [System.Collections.Generic.List[string]]::new()
    $xml = Get-ZipEntryText -Archive $Archive -EntryName $ChartEntry
    if ([string]::IsNullOrWhiteSpace($xml)) { return $lines }
    $titleM = [regex]::Match($xml, '<c:title>(.*?)</c:title>', 'Singleline')
    if ($titleM.Success) {
        $t = (([regex]::Matches($titleM.Groups[1].Value, '<a:t>(.*?)</a:t>', 'Singleline') | ForEach-Object { $_.Groups[1].Value }) -join '')
        $t = (Convert-XmlEntity -Text $t).Trim()
        if ($t) { $lines.Add("[Chart] Title: $t") }
    }
    foreach ($serM in [regex]::Matches($xml, '<c:ser>(.*?)</c:ser>', 'Singleline')) {
        $ser = $serM.Groups[1].Value
        $name = ''
        $txM = [regex]::Match($ser, '<c:tx>(.*?)</c:tx>', 'Singleline')
        if ($txM.Success) { $name = (Convert-XmlEntity -Text ([regex]::Match($txM.Groups[1].Value, '<c:v>(.*?)</c:v>', 'Singleline').Groups[1].Value)).Trim() }
        $cats = @()
        $catM = [regex]::Match($ser, '<c:cat>(.*?)</c:cat>', 'Singleline')
        if ($catM.Success) { $cats = @([regex]::Matches($catM.Groups[1].Value, '<c:pt\b[^>]*>\s*<c:v>(.*?)</c:v>', 'Singleline') | ForEach-Object { (Convert-XmlEntity -Text $_.Groups[1].Value).Trim() }) }
        $vals = @()
        $valM = [regex]::Match($ser, '<c:val>(.*?)</c:val>', 'Singleline')
        if ($valM.Success) { $vals = @([regex]::Matches($valM.Groups[1].Value, '<c:pt\b[^>]*>\s*<c:v>(.*?)</c:v>', 'Singleline') | ForEach-Object { (Convert-XmlEntity -Text $_.Groups[1].Value).Trim() }) }
        $prefix = if ($name) { "[Chart] $name" } else { "[Chart] series" }
        if ($vals.Count -gt 0 -and $cats.Count -eq $vals.Count) {
            $pairs = for ($i = 0; $i -lt $vals.Count; $i++) { "$($cats[$i])=$($vals[$i])" }
            $lines.Add(($prefix + ': ' + ($pairs -join ' | ')))
        }
        elseif ($vals.Count -gt 0) { $lines.Add(($prefix + ': ' + ($vals -join ' | '))) }
        elseif ($name) { $lines.Add($prefix) }
    }
    return $lines
}

# Extract SmartArt/diagram text from a ppt/diagrams/dataN.xml part.
function Get-OoxmlDiagramText {
    param([System.IO.Compression.ZipArchive]$Archive, [string]$DataEntry)
    $lines = [System.Collections.Generic.List[string]]::new()
    $xml = Get-ZipEntryText -Archive $Archive -EntryName $DataEntry
    if ([string]::IsNullOrWhiteSpace($xml)) { return $lines }
    $texts = @([regex]::Matches($xml, '<a:t>(.*?)</a:t>', 'Singleline') | ForEach-Object { (Convert-XmlEntity -Text $_.Groups[1].Value).Trim() } | Where-Object { $_ })
    if ($texts.Count -gt 0) { $lines.Add("[SmartArt] " + ($texts -join ' | ')) }
    return $lines
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
        # Charts are separate parts referenced from the document rels; surface their
        # cached numbers so evidence held only in a graph is not lost.
        foreach ($rel in (Get-OoxmlRels -Archive $zip -RelsEntryName 'word/_rels/document.xml.rels' -BaseDir 'word')) {
            if ($rel.Type -like '*/chart') {
                foreach ($cl in (Get-OoxmlChartText -Archive $zip -ChartEntry $rel.Target)) { Write-Output $cl }
            }
        }
    }
    finally { $zip.Dispose() }
}

function Convert-OoxmlPptx {
    param([string]$FilePath)
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($FilePath)
    try {
        $slidePaths = Get-PptxSlideOrder -Archive $zip
        Write-Output "===== SECTIONS DETECTED: $($slidePaths.Count) slides ====="
        $slideNumber = 0
        foreach ($slidePath in $slidePaths) {
            $slideNumber++
            $slideText = Convert-XmlToText -Xml (Get-ZipEntryText -Archive $zip -EntryName $slidePath)
            Write-Output ''
            Write-Output "----- SLIDE $slideNumber -----"
            if (-not [string]::IsNullOrWhiteSpace($slideText)) { Write-Output $slideText }
            else { Write-Output "[No readable text on this slide. Any evidence in raster graphics is Not evidenced.]" }

            # Resolve this slide's own relationships so notes, charts, and SmartArt are
            # attributed to the correct slide (notesSlideN is NOT positional).
            $slideDir = ($slidePath -replace '/[^/]+$', '')
            $slideFile = ($slidePath -split '/')[-1]
            $rels = Get-OoxmlRels -Archive $zip -RelsEntryName "$slideDir/_rels/$slideFile.rels" -BaseDir $slideDir
            foreach ($rel in $rels) {
                if ($rel.Type -like '*/chart') {
                    foreach ($cl in (Get-OoxmlChartText -Archive $zip -ChartEntry $rel.Target)) { Write-Output $cl }
                }
                elseif ($rel.Type -like '*/diagramData') {
                    foreach ($dl in (Get-OoxmlDiagramText -Archive $zip -DataEntry $rel.Target)) { Write-Output $dl }
                }
            }
            $notesRel = $rels | Where-Object { $_.Type -like '*/notesSlide' } | Select-Object -First 1
            if ($notesRel) {
                $notesText = Convert-XmlToText -Xml (Get-ZipEntryText -Archive $zip -EntryName $notesRel.Target)
                if (-not [string]::IsNullOrWhiteSpace($notesText)) { Write-Output "  [Speaker notes] $notesText" }
            }
        }
    }
    finally { $zip.Dispose() }
}

function Convert-LegacyDoc {
    param([string]$FilePath)
    if (-not (Test-ComAvailable 'Word.Application')) {
        Write-Output "===== CONTENT UNAVAILABLE: legacy Word file but Microsoft Word is not installed on this machine. Provide a .docx or a text export. ====="
        return
    }
    for ($attempt = 1; $attempt -le 2; $attempt++) {
        $doc = $null
        try {
            $word = Get-WordApp
            $doc = $word.Documents.Open($FilePath, $false, $true)  # ConfirmConversions=false, ReadOnly=true
            $text = $doc.Content.Text
            Write-Output "===== SECTIONS DETECTED: legacy Word document (COM extraction) ====="
            # Word marks table cell / end-of-row with BEL (0x07), and each cell paragraph
            # ends with CR (0x0D). Fold "CR*+BEL" into a " | " column delimiter so a table
            # row stays on one line; remaining CRs become newlines.
            $text = [regex]::Replace($text, "[\r]*[\a]", ' | ')
            $text = $text -replace "`r", "`n"
            $text = [regex]::Replace($text, '(?: \| )+', ' | ')      # collapse repeated delimiters
            $text = [regex]::Replace($text, '(?m)^\s*\|\s*', '')      # strip leading delimiter per line
            $text = [regex]::Replace($text, '(?m)\s*\|\s*$', '')      # strip trailing delimiter per line
            Write-Output $text
            # Charts embedded in the document are not part of Content.Text; surface their
            # cached data from inline and floating shapes (best effort).
            try {
                $inl = $doc.InlineShapes
                for ($i = 1; $i -le $inl.Count; $i++) {
                    try { if ($inl.Item($i).HasChart) { foreach ($l in (Get-ComChartLines -Chart $inl.Item($i).Chart)) { Write-Output $l } } } catch { }
                }
            }
            catch { }
            try {
                $shp = $doc.Shapes
                for ($i = 1; $i -le $shp.Count; $i++) {
                    try { if ($shp.Item($i).HasChart) { foreach ($l in (Get-ComChartLines -Chart $shp.Item($i).Chart)) { Write-Output $l } } } catch { }
                }
            }
            catch { }
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

# Read a chart's data via COM (works for PowerPoint, Word, and Excel chart objects),
# returning readable "[Chart] name: cat=val | ..." lines from the series collection.
function Get-ComChartLines {
    param($Chart)
    $lines = [System.Collections.Generic.List[string]]::new()
    try {
        $title = ''
        try { if ($Chart.HasTitle) { $title = "$($Chart.ChartTitle.Text)".Trim() } } catch { }
        if ($title) { $lines.Add("[Chart] Title: $title") }
        $cats = @()
        $series = $Chart.SeriesCollection()
        $count = 0
        try { $count = $series.Count } catch { $count = 0 }
        for ($i = 1; $i -le $count; $i++) {
            $s = $series.Item($i)
            $name = ''
            try { $name = "$($s.Name)".Trim() } catch { }
            if ($i -eq 1) { try { $cats = @($s.XValues) } catch { $cats = @() } }
            $vals = @()
            try { $vals = @($s.Values) } catch { $vals = @() }
            $prefix = if ($name) { "[Chart] $name" } else { "[Chart] series $i" }
            if ($vals.Count -gt 0 -and $cats.Count -eq $vals.Count) {
                $pairs = for ($k = 0; $k -lt $vals.Count; $k++) { "$($cats[$k])=$($vals[$k])" }
                $lines.Add(($prefix + ': ' + ($pairs -join ' | ')))
            }
            elseif ($vals.Count -gt 0) { $lines.Add(($prefix + ': ' + ($vals -join ' | '))) }
            elseif ($name) { $lines.Add($prefix) }
        }
    }
    catch { }
    return $lines
}

# Recursively read readable text from one PowerPoint COM shape: plain text frames,
# native tables (row-structured), charts (cached data), grouped shapes, and a
# best-effort pass over SmartArt nodes. Additive to the old text-only behaviour.
function Get-PptComShapeLines {
    param($Shape)
    $out = [System.Collections.Generic.List[string]]::new()
    # Grouped shapes: recurse into members (msoGroup = 6).
    try {
        if ($Shape.Type -eq 6) {
            for ($g = 1; $g -le $Shape.GroupItems.Count; $g++) {
                foreach ($l in (Get-PptComShapeLines -Shape $Shape.GroupItems.Item($g))) { $out.Add($l) }
            }
            return $out
        }
    }
    catch { }
    # Native table: emit each row as "c1 | c2 | c3".
    try {
        if ($Shape.HasTable) {
            $tbl = $Shape.Table
            for ($r = 1; $r -le $tbl.Rows.Count; $r++) {
                $cells = for ($c = 1; $c -le $tbl.Columns.Count; $c++) {
                    $t = ''
                    try { $t = "$($tbl.Cell($r, $c).Shape.TextFrame.TextRange.Text)".Trim() } catch { }
                    $t
                }
                $line = ($cells -join ' | ').Trim()
                if (-not [string]::IsNullOrWhiteSpace(($line -replace '\|', '').Trim())) { $out.Add($line) }
            }
            return $out
        }
    }
    catch { }
    # Chart: emit cached series/category values.
    try {
        if ($Shape.HasChart) {
            foreach ($l in (Get-ComChartLines -Chart $Shape.Chart)) { $out.Add($l) }
            return $out
        }
    }
    catch { }
    # SmartArt: best-effort node text (msoTrue = -1).
    try {
        if ($Shape.HasSmartArt -eq -1) {
            $texts = [System.Collections.Generic.List[string]]::new()
            $nodes = $Shape.SmartArt.AllNodes
            for ($n = 1; $n -le $nodes.Count; $n++) {
                $t = ''
                try { $t = "$($nodes.Item($n).TextFrame2.TextRange.Text)".Trim() } catch { }
                if ($t) { $texts.Add($t) }
            }
            if ($texts.Count -gt 0) { $out.Add("[SmartArt] " + ($texts -join ' | ')); return $out }
        }
    }
    catch { }
    # Plain text frame (original behaviour).
    try {
        if ($Shape.HasTextFrame -and $Shape.TextFrame.HasText) { $out.Add("$($Shape.TextFrame.TextRange.Text)") }
    }
    catch { }
    return $out
}

function Convert-LegacyPpt {
    param([string]$FilePath)
    if (-not (Test-ComAvailable 'PowerPoint.Application')) {
        Write-Output "===== CONTENT UNAVAILABLE: legacy PowerPoint file but Microsoft PowerPoint is not installed on this machine. Provide a .pptx or a text/HTML export. ====="
        return
    }
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
                    foreach ($line in (Get-PptComShapeLines -Shape $shape)) { Write-Output $line }
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

# Classify an Excel number format as date, percent, or general, using builtin numFmtId
# ranges plus any custom formatCode. Used to render serials/fractions readably.
function Get-XlsxNumFmtKind {
    param([int]$FmtId, [hashtable]$CustomFmt)
    $dateBuiltin = @(14, 15, 16, 17, 18, 19, 20, 21, 22, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 45, 46, 47, 50, 51, 52, 53, 54, 55, 56, 57, 58)
    $pctBuiltin = @(9, 10)
    if ($pctBuiltin -contains $FmtId) { return 'percent' }
    if ($dateBuiltin -contains $FmtId) { return 'date' }
    if ($CustomFmt.ContainsKey($FmtId)) {
        $code = $CustomFmt[$FmtId]
        if ($code -match '%') { return 'percent' }
        $stripped = ($code -replace '\\.', '') -replace '"[^"]*"', ''
        if ($stripped -match '[yYdD]' -or $stripped -match '[hHsS]') { return 'date' }
    }
    return 'general'
}

# Render a numeric cell value using its style's number format: date serials become
# ISO dates and percentage cells become NN% instead of raw stored numbers.
function Format-XlsxNumeric {
    param([string]$Raw, [string]$StyleIdx, $CellXfsFmtId, [hashtable]$CustomFmt)
    if ([string]::IsNullOrWhiteSpace($Raw)) { return $Raw }
    if ([string]::IsNullOrWhiteSpace($StyleIdx)) { return $Raw }
    $sIdx = [int]$StyleIdx
    if ($sIdx -lt 0 -or $sIdx -ge $CellXfsFmtId.Count) { return $Raw }
    $fmtId = $CellXfsFmtId[$sIdx]
    $kind = Get-XlsxNumFmtKind -FmtId $fmtId -CustomFmt $CustomFmt
    if ($kind -eq 'general') { return $Raw }
    $num = 0.0
    if (-not [double]::TryParse($Raw, [System.Globalization.NumberStyles]::Any, [System.Globalization.CultureInfo]::InvariantCulture, [ref]$num)) { return $Raw }
    switch ($kind) {
        'date' { try { return ([DateTime]::FromOADate($num)).ToString('yyyy-MM-dd') } catch { return $Raw } }
        'percent' { return ("{0:0.##}" -f ($num * 100)) + '%' }
        default { return $Raw }
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

        # Style table: map each cellXfs index -> numFmtId, plus custom format codes, so
        # date serials and percentages are rendered as dates/percentages, not raw numbers.
        $customFmt = @{}
        $cellXfsFmtId = New-Object System.Collections.Generic.List[int]
        $stylesXml = Get-ZipEntryText -Archive $zip -EntryName 'xl/styles.xml'
        if (-not [string]::IsNullOrWhiteSpace($stylesXml)) {
            foreach ($m in [regex]::Matches($stylesXml, '<numFmt\b[^>]*?/>')) {
                $fid = [regex]::Match($m.Value, 'numFmtId="([^"]+)"').Groups[1].Value
                $code = Convert-XmlEntity -Text ([regex]::Match($m.Value, 'formatCode="([^"]*)"').Groups[1].Value)
                if ($fid -match '^\d+$') { $customFmt[[int]$fid] = $code }
            }
            $cellXfsM = [regex]::Match($stylesXml, '<cellXfs\b[^>]*>(.*?)</cellXfs>', 'Singleline')
            if ($cellXfsM.Success) {
                foreach ($xf in [regex]::Matches($cellXfsM.Groups[1].Value, '<xf\b[^>]*?/?>')) {
                    $nid = [regex]::Match($xf.Value, 'numFmtId="([^"]+)"').Groups[1].Value
                    if ($nid -match '^\d+$') { $cellXfsFmtId.Add([int]$nid) } else { $cellXfsFmtId.Add(0) }
                }
            }
        }

        # Sheet names and true order come from xl/workbook.xml; fall back to filename order.
        $sheets = [System.Collections.Generic.List[object]]::new()
        $workbookXml = Get-ZipEntryText -Archive $zip -EntryName 'xl/workbook.xml'
        if (-not [string]::IsNullOrWhiteSpace($workbookXml)) {
            $wbRelMap = @{}
            foreach ($r in (Get-OoxmlRels -Archive $zip -RelsEntryName 'xl/_rels/workbook.xml.rels' -BaseDir 'xl')) { $wbRelMap[$r.Id] = $r.Target }
            foreach ($m in [regex]::Matches($workbookXml, '<sheet\b[^>]*?/>')) {
                $nm = Convert-XmlEntity -Text ([regex]::Match($m.Value, 'name="([^"]*)"').Groups[1].Value)
                $rid = [regex]::Match($m.Value, 'r:id="([^"]+)"').Groups[1].Value
                if ($rid -and $wbRelMap.ContainsKey($rid)) { $sheets.Add([pscustomobject]@{ Name = $nm; Target = $wbRelMap[$rid] }) }
            }
        }
        if ($sheets.Count -eq 0) {
            $zip.Entries |
                Where-Object { $_.FullName -match '^xl/worksheets/sheet\d+\.xml$' } |
                Sort-Object { [int]([regex]::Match($_.FullName, '\d+').Value) } |
                ForEach-Object { $sheets.Add([pscustomobject]@{ Name = $null; Target = $_.FullName }) }
        }

        Write-Output "===== SECTIONS DETECTED: $($sheets.Count) worksheet(s) (cite by sheet name and row) ====="
        $sheetNumber = 0
        foreach ($sheet in $sheets) {
            $sheetNumber++
            $label = if ($sheet.Name) { $sheet.Name } else { "sheet$sheetNumber" }
            Write-Output ''
            Write-Output "----- SHEET $sheetNumber ($label) -----"
            $sheetXml = Get-ZipEntryText -Archive $zip -EntryName $sheet.Target
            foreach ($rowMatch in [regex]::Matches($sheetXml, '<row[^>]*>(.*?)</row>', 'Singleline')) {
                $cells = New-Object System.Collections.Generic.List[string]
                foreach ($cellMatch in [regex]::Matches($rowMatch.Groups[1].Value, '<c\b(?<attrs>[^>]*)>(?<body>.*?)</c>', 'Singleline')) {
                    $type = [regex]::Match($cellMatch.Groups['attrs'].Value, 't="(?<t>[^"]+)"').Groups['t'].Value
                    $style = [regex]::Match($cellMatch.Groups['attrs'].Value, 's="(?<s>\d+)"').Groups['s'].Value
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
                    elseif ($type -eq 'str') {
                        $value = Convert-XmlEntity -Text ([regex]::Match($body, '<v>(?<v>.*?)</v>', 'Singleline').Groups['v'].Value)
                    }
                    else {
                        $raw = Convert-XmlEntity -Text ([regex]::Match($body, '<v>(?<v>.*?)</v>', 'Singleline').Groups['v'].Value)
                        $value = Format-XlsxNumeric -Raw $raw -StyleIdx $style -CellXfsFmtId $cellXfsFmtId -CustomFmt $customFmt
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
    if (-not (Test-ComAvailable 'Excel.Application')) {
        Write-Output "===== CONTENT UNAVAILABLE: legacy Excel file but Microsoft Excel is not installed on this machine. Provide a .xlsx or a .csv export. ====="
        return
    }
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
                # .Value() (invoked parameterized property, not .Value2) returns typed
                # values, so date cells arrive as DateTime and render as ISO dates.
                $data = $used.Value()
                $rowCount = $used.Rows.Count
                $colCount = $used.Columns.Count
                if ($rowCount -le 1 -and $colCount -le 1) {
                    if ($null -ne $data) {
                        if ($data -is [DateTime]) { Write-Output ($data.ToString('yyyy-MM-dd')) } else { Write-Output "$data" }
                    }
                }
                else {
                    # Sample each column's number format once (columns are usually uniform)
                    # so percentage cells render as NN% instead of a raw fraction.
                    $colIsPct = New-Object bool[] ($colCount + 1)
                    $sampleRow = if ($rowCount -ge 2) { 2 } else { 1 }
                    for ($c = 1; $c -le $colCount; $c++) {
                        try { $colIsPct[$c] = ("$($used.Cells.Item($sampleRow, $c).NumberFormat)" -match '%') } catch { $colIsPct[$c] = $false }
                    }
                    for ($r = 1; $r -le $rowCount; $r++) {
                        $rowCells = for ($c = 1; $c -le $colCount; $c++) {
                            $cell = $data[$r, $c]
                            if ($cell -is [DateTime]) { $cell.ToString('yyyy-MM-dd') }
                            elseif ($colIsPct[$c] -and $cell -is [double] -and $r -gt 1) { ("{0:0.##}" -f ($cell * 100)) + '%' }
                            else { "$cell" }
                        }
                        $line = ($rowCells -join ' | ').Trim()
                        if (-not [string]::IsNullOrWhiteSpace(($line -replace '\|', '').Trim())) { Write-Output $line }
                    }
                }
                # Charts on the sheet: surface their cached data (best effort).
                try {
                    $charts = $ws.ChartObjects()
                    $cc = 0
                    try { $cc = $charts.Count } catch { $cc = 0 }
                    for ($i = 1; $i -le $cc; $i++) {
                        foreach ($l in (Get-ComChartLines -Chart $charts.Item($i).Chart)) { Write-Output $l }
                    }
                }
                catch { }
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
    # Guard against a pathological huge text/CSV/JSON/log file bloating the intake and
    # slowing the run. Proposal text files are tiny; cap the read at a generous size and
    # emit a visible truncation marker so the evaluator flags it rather than trusting a
    # partial read silently.
    $maxBytes = 3MB
    $len = (Get-Item -LiteralPath $FilePath).Length
    if ($len -gt $maxBytes) {
        $sr = New-Object System.IO.StreamReader($FilePath, [System.Text.Encoding]::UTF8)
        try {
            $buffer = New-Object char[] ([int]$maxBytes)
            $read = $sr.Read($buffer, 0, $buffer.Length)
            $content = -join $buffer[0..([Math]::Max(0, $read - 1))]
        }
        finally { $sr.Dispose() }
        Write-Output "===== SECTIONS DETECTED: $Kind, TRUNCATED at $([int]($maxBytes/1MB)) MB of $([math]::Round($len/1MB,1)) MB (cite by line number) ====="
        Write-Output $content
        Write-Output "===== CONTENT TRUNCATED: file exceeds $([int]($maxBytes/1MB)) MB; remainder omitted. Treat any evidence expected beyond this point as Not evidenced and request a smaller export. ====="
        return
    }
    $content = Get-Content -LiteralPath $FilePath -Raw -Encoding UTF8
    if ($null -eq $content) { $content = '' }
    $lineCount = ($content -split "`n").Count
    Write-Output "===== SECTIONS DETECTED: $Kind, $lineCount lines (cite by line number) ====="
    Write-Output $content
}

# Resolve pdftotext (poppler) once. When absent, PDFs fail instantly instead of hanging.
$script:PdftotextPath = $null
$script:PdftotextResolved = $false
function Get-PdftotextPath {
    if (-not $script:PdftotextResolved) {
        $cmd = Get-Command 'pdftotext' -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
        $script:PdftotextPath = if ($cmd) { $cmd.Source } else { $null }
        $script:PdftotextResolved = $true
    }
    return $script:PdftotextPath
}

function Convert-Pdf {
    param([string]$FilePath)
    $tool = Get-PdftotextPath
    if (-not $tool) {
        Write-Output "===== CONTENT UNAVAILABLE: PDF file but 'pdftotext' (poppler) is not installed on this machine. Install poppler (winget install oschwartz10612.Poppler or choco install poppler), or provide a .docx/.pptx/.txt/.html export. ====="
        return
    }
    # -layout keeps columns/tables readable. Run with a hard timeout and output written
    # to a temp file so a malformed PDF cannot hang the run; kill and skip on timeout.
    # System.Diagnostics.Process with ArgumentList quotes each arg correctly (the file
    # path may contain spaces), unlike Start-Process -ArgumentList.
    $outFile = [System.IO.Path]::GetTempFileName()
    $proc = New-Object System.Diagnostics.Process
    try {
        $proc.StartInfo.FileName = $tool
        foreach ($a in @('-layout', '-enc', 'UTF-8', '-q', '--', $FilePath, $outFile)) { $proc.StartInfo.ArgumentList.Add($a) }
        $proc.StartInfo.UseShellExecute = $false
        $proc.StartInfo.CreateNoWindow = $true
        $proc.StartInfo.RedirectStandardError = $true
        [void]$proc.Start()
        $null = $proc.StandardError.ReadToEndAsync()
        if (-not $proc.WaitForExit(60000)) {
            try { $proc.Kill($true) } catch { }
            Write-Output "===== CONTENT UNAVAILABLE: PDF extraction exceeded 60s and was skipped. Request a .docx/.pptx/.txt/.html export. ====="
            return
        }
        $text = if (Test-Path -LiteralPath $outFile) { Get-Content -LiteralPath $outFile -Raw -Encoding UTF8 } else { '' }
        if ($proc.ExitCode -ne 0 -or [string]::IsNullOrWhiteSpace($text)) {
            Write-Output "===== CONTENT UNAVAILABLE: PDF has no extractable text (likely scanned/image-only). View it with a multimodal viewer or request a text/HTML export. ====="
            return
        }
        $body = $text.Trim()
        $lineCount = ($body -split "`n").Count
        Write-Output "===== SECTIONS DETECTED: PDF, $lineCount lines (pdftotext -layout; cite by line number) ====="
        Write-Output $body
    }
    finally {
        try { $proc.Dispose() } catch { }
        Remove-Item -LiteralPath $outFile -Force -ErrorAction SilentlyContinue
    }
}

function Write-ImageMarker {
    param([string]$FilePath)
    Write-Output "===== IMAGE SUBMISSION: content is not text-extractable by this script ====="
    Write-Output "===== ACTION: view this image with a multimodal viewer to read the wireframe/diagram. If multimodal viewing is unavailable, mark it Not evidenced and request a text/HTML alternative or an accessible description. ====="
    Write-Output "IMAGE_PATH: $FilePath"
}

function Invoke-ExtractOneFile {
    param([string]$FilePath)
    # Emit the FILE header first so every artefact has exactly one header even if the
    # signature read or a converter throws (the main loop's catch adds only the marker).
    Write-Output "===== FILE: $(Split-Path -Leaf $FilePath) ====="

    $item = Get-Item -LiteralPath $FilePath
    $fullPath = $item.FullName
    $extension = $item.Extension.ToLowerInvariant()
    $signature = Get-FileSignature -FilePath $fullPath
    $isZip = $signature.StartsWith('50-4B')          # "PK" -> Open XML package
    $isOle = $signature.StartsWith('D0-CF-11-E0')    # OLE compound -> legacy Office binary

    Write-Output "===== TYPE: $extension (signature $signature) ====="

    switch ($extension) {
        '.docx' { if ($isZip) { Convert-OoxmlDocx -FilePath $fullPath } else { Convert-LegacyDoc -FilePath $fullPath } }
        '.doc'  { Convert-LegacyDoc -FilePath $fullPath }
        '.pptx' { if ($isZip) { Convert-OoxmlPptx -FilePath $fullPath } else { Convert-LegacyPpt -FilePath $fullPath } }
        '.ppt'  { Convert-LegacyPpt -FilePath $fullPath }
        '.xlsx' { if ($isZip) { Convert-OoxmlXlsx -FilePath $fullPath } else { Convert-LegacyXls -FilePath $fullPath } }
        '.xls'  { Convert-LegacyXls -FilePath $fullPath }
        '.pdf'  { Convert-Pdf -FilePath $fullPath }
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
$acceptedAll = $script:CodeExtensions + $script:ImageExtensions + $script:OfficeExtensions + $script:PdfExtensions
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
        # Per-file isolation: a failure extracting one file (locked, corrupt, access
        # denied, unexpected COM error) must never abort the rest of the batch. The
        # FILE header is emitted inside Invoke-ExtractOneFile before any throw risk, so
        # here we add only the failure marker.
        try {
            Invoke-ExtractOneFile -FilePath $target
        }
        catch {
            Write-Output "===== CONTENT UNAVAILABLE: extraction failed for this file and was skipped: $($_.Exception.Message) ====="
        }
    }
}
finally {
    Close-ComApps
}
