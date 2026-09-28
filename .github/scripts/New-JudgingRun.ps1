<#
.SYNOPSIS
    Stages a timestamped judging run: creates the run folder, extracts each team
    folder into an intake Markdown cache, and writes a run-manifest.json.

.DESCRIPTION
    Deterministic staging step for the Proposal Judge pipeline. It replaces ad-hoc
    inline PowerShell (and unreliable subagent staging) with a single, repeatable
    command so every run is created the same way.

      1. Reads judge.config.json (paths resolve relative to the repo root).
      2. Creates resultsPath/<resultsRunPrefix>-<yyyyMMdd-HHmmss>/intake/.
      3. For each immediate team subfolder that contains accepted files, extracts
         the whole folder in one pass via Extract-SubmissionText.ps1 into
         intake/<team>.md. Loose accepted files at the submissions root are staged
         as single-file teams.
      4. Writes run-manifest.json (runId, timestamps, paths, teams, files, and any
         CONTENT UNAVAILABLE markers detected in the intake).

    The finalized per-team evaluations and 00-cross-submission-summary.md are written
    into the same run folder later by the orchestrator.

.PARAMETER SubmissionsPath
    Optional override for the submissions folder. Defaults to config submissionsPath.

.EXAMPLE
    ./.github/scripts/New-JudgingRun.ps1

.EXAMPLE
    # Stage only one team folder:
    ./.github/scripts/New-JudgingRun.ps1 -SubmissionsPath 'WorkShopSubmission/Team A'
#>
[CmdletBinding()]
param(
    [string]$SubmissionsPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$configPath = Join-Path $repoRoot 'judge.config.json'
if (-not (Test-Path -LiteralPath $configPath)) {
    Write-Error "judge.config.json not found at $configPath"
    exit 1
}
$config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json

function Resolve-ConfiguredPath {
    param([string]$PathValue)
    if ([System.IO.Path]::IsPathRooted($PathValue)) { return $PathValue }
    return (Join-Path $repoRoot $PathValue)
}

$submissionsRoot = if ($SubmissionsPath) { Resolve-ConfiguredPath $SubmissionsPath } else { Resolve-ConfiguredPath $config.submissionsPath }
$resultsPath = Resolve-ConfiguredPath $config.resultsPath
$accepted = @($config.acceptedExtensions)
$prefix = if ($config.PSObject.Properties.Name -contains 'resultsRunPrefix') { $config.resultsRunPrefix } else { 'run' }
$extractScript = Join-Path $PSScriptRoot 'Extract-SubmissionText.ps1'

if (-not (Test-Path -LiteralPath $submissionsRoot)) {
    Write-Error "Submissions path not found: $submissionsRoot"
    exit 1
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$runFolder = Join-Path $resultsPath "$prefix-$stamp"
$intake = Join-Path $runFolder 'intake'
New-Item -ItemType Directory -Path $intake -Force | Out-Null

function Get-SafeName {
    param([string]$Name)
    return ($Name -replace '[^A-Za-z0-9._-]', '_')
}

function Get-TableNumber {
    # Parse the trailing table number from a team folder name, ignoring the
    # city/cohort prefix and case (Hyd_table4 -> 4, Blr_Table4 -> 4). Returns
    # 'unresolved' when there is no trailing number to gate on.
    param([string]$Name)
    $m = [regex]::Match($Name, '(\d+)\s*$')
    if ($m.Success) { return $m.Groups[1].Value }
    return 'unresolved'
}

# Run-scoped provenance nonce. Stamped into every intake banner so a judge that
# ever cites text from a sibling team's file (same table number, near-identical
# deck) can detect the mismatch. Four hex chars is enough to disambiguate a run.
$nonce = (Get-Random -Minimum 4096 -Maximum 65535).ToString('x4')

$teams = [System.Collections.Generic.List[object]]::new()

# Build the work list first (cheap metadata scan), then extract teams concurrently.
# Each team folder is independent, so on PS7+ extraction runs in parallel across teams
# (this also overlaps any slow first read of cloud/OneDrive placeholder files).
$work = [System.Collections.Generic.List[object]]::new()

# One intake file per team subfolder (all accepted files extracted together).
foreach ($dir in (Get-ChildItem -LiteralPath $submissionsRoot -Directory)) {
    $files = @(Get-ChildItem -LiteralPath $dir.FullName -File -Recurse |
        Where-Object { $accepted -contains $_.Extension.ToLowerInvariant() })
    if ($files.Count -eq 0) { continue }
    $work.Add([pscustomobject]@{
            Kind       = 'dir'
            Name       = $dir.Name
            Table      = (Get-TableNumber $dir.Name)
            Path       = $dir.FullName
            IntakeFile = Join-Path $intake ((Get-SafeName $dir.Name) + '.md')
            Files      = @($files.FullName)
        })
}

# Loose accepted files at the submissions root are single-file teams.
foreach ($file in (Get-ChildItem -LiteralPath $submissionsRoot -File |
        Where-Object { $accepted -contains $_.Extension.ToLowerInvariant() })) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $work.Add([pscustomobject]@{
            Kind       = 'file'
            Name       = $baseName
            Table      = (Get-TableNumber $baseName)
            Path       = $file.FullName
            IntakeFile = Join-Path $intake ((Get-SafeName $baseName) + '.md')
            Files      = @($file.FullName)
        })
}

$throttle = [Math]::Max(1, [Math]::Min([Environment]::ProcessorCount, 6))

if ($PSVersionTable.PSVersion.Major -ge 7 -and $work.Count -gt 1) {
    $results = $work | ForEach-Object -ThrottleLimit $throttle -Parallel {
        $item = $_
        $es = $using:extractScript
        $nonce = $using:nonce
        $banner = "<!-- TEAM: $($item.Name) | TABLE: $($item.Table) | RUN-NONCE: $nonce -->"
        $body = if ($item.Kind -eq 'dir') { & $es -Directory $item.Path -Recurse } else { & $es -Path $item.Path }
        Set-Content -LiteralPath $item.IntakeFile -Value (@($banner, '') + $body) -Encoding UTF8
        $unavailable = @(Select-String -LiteralPath $item.IntakeFile -Pattern 'CONTENT UNAVAILABLE' -SimpleMatch).Count
        [pscustomobject]@{
            Name = $item.Name; Table = $item.Table; Path = $item.Path; Intake = $item.IntakeFile
            FileCount = $item.Files.Count; Files = $item.Files; Unavailable = $unavailable
        }
    }
}
else {
    $results = foreach ($item in $work) {
        $banner = "<!-- TEAM: $($item.Name) | TABLE: $($item.Table) | RUN-NONCE: $nonce -->"
        $body = if ($item.Kind -eq 'dir') { & $extractScript -Directory $item.Path -Recurse } else { & $extractScript -Path $item.Path }
        Set-Content -LiteralPath $item.IntakeFile -Value (@($banner, '') + $body) -Encoding UTF8
        $unavailable = @(Select-String -LiteralPath $item.IntakeFile -Pattern 'CONTENT UNAVAILABLE' -SimpleMatch).Count
        [pscustomobject]@{
            Name = $item.Name; Table = $item.Table; Path = $item.Path; Intake = $item.IntakeFile
            FileCount = $item.Files.Count; Files = $item.Files; Unavailable = $unavailable
        }
    }
}

foreach ($r in ($results | Sort-Object Name)) {
    $teams.Add([ordered]@{
            name        = $r.Name
            table       = $r.Table
            path        = $r.Path
            intake      = $r.Intake
            fileCount   = $r.FileCount
            files       = @($r.Files)
            unavailable = $r.Unavailable
        })
}

if ($teams.Count -eq 0) {
    Write-Warning "No accepted submissions found in $submissionsRoot. Removing empty run folder."
    Remove-Item -LiteralPath $runFolder -Recurse -Force
    exit 2
}

$manifest = [ordered]@{
    runId           = "$prefix-$stamp"
    createdUtc      = (Get-Date).ToUniversalTime().ToString('o')
    runNonce        = $nonce
    submissionsPath = $submissionsRoot
    resultsPath     = $runFolder
    intakePath      = $intake
    teams           = @($teams)
}
$manifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $runFolder 'run-manifest.json') -Encoding UTF8

Write-Output "RUN FOLDER: $runFolder"
Write-Output "RUN NONCE: $nonce"
foreach ($team in $teams) {
    $flag = if ($team.unavailable -gt 0) { " (CONTENT UNAVAILABLE x$($team.unavailable))" } else { '' }
    Write-Output ("TEAM: {0} | table={1} | files={2} | intake={3}{4}" -f $team.name, $team.table, $team.fileCount, $team.intake, $flag)
}
