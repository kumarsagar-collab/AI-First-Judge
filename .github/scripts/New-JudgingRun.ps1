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

$teams = [System.Collections.Generic.List[object]]::new()

# One intake file per team subfolder (all accepted files extracted together).
foreach ($dir in (Get-ChildItem -LiteralPath $submissionsRoot -Directory)) {
    $files = @(Get-ChildItem -LiteralPath $dir.FullName -File -Recurse |
        Where-Object { $accepted -contains $_.Extension.ToLowerInvariant() })
    if ($files.Count -eq 0) { continue }
    $intakeFile = Join-Path $intake ((Get-SafeName $dir.Name) + '.md')
    & $extractScript -Directory $dir.FullName -Recurse | Set-Content -LiteralPath $intakeFile -Encoding UTF8
    $unavailable = @(Select-String -LiteralPath $intakeFile -Pattern 'CONTENT UNAVAILABLE' -SimpleMatch).Count
    $teams.Add([ordered]@{
            name        = $dir.Name
            path        = $dir.FullName
            intake      = $intakeFile
            fileCount   = $files.Count
            files       = @($files.FullName)
            unavailable = $unavailable
        })
}

# Loose accepted files at the submissions root are single-file teams.
foreach ($file in (Get-ChildItem -LiteralPath $submissionsRoot -File |
        Where-Object { $accepted -contains $_.Extension.ToLowerInvariant() })) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $intakeFile = Join-Path $intake ((Get-SafeName $baseName) + '.md')
    & $extractScript -Path $file.FullName | Set-Content -LiteralPath $intakeFile -Encoding UTF8
    $unavailable = @(Select-String -LiteralPath $intakeFile -Pattern 'CONTENT UNAVAILABLE' -SimpleMatch).Count
    $teams.Add([ordered]@{
            name        = $baseName
            path        = $file.FullName
            intake      = $intakeFile
            fileCount   = 1
            files       = @($file.FullName)
            unavailable = $unavailable
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
    submissionsPath = $submissionsRoot
    resultsPath     = $runFolder
    intakePath      = $intake
    teams           = @($teams)
}
$manifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $runFolder 'run-manifest.json') -Encoding UTF8

Write-Output "RUN FOLDER: $runFolder"
foreach ($team in $teams) {
    $flag = if ($team.unavailable -gt 0) { " (CONTENT UNAVAILABLE x$($team.unavailable))" } else { '' }
    Write-Output ("TEAM: {0} | files={1} | intake={2}{3}" -f $team.name, $team.fileCount, $team.intake, $flag)
}
