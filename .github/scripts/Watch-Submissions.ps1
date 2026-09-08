<#
.SYNOPSIS
    Watches the submissions folder (local or a synced OneDrive/SharePoint folder)
    and stages a timestamped run when new files land.

.DESCRIPTION
    A VS Code Copilot agent is interactive: it cannot run headless and wake itself
    when a cloud file arrives. This script bridges that gap for LOCAL use. It
    watches submissionsPath (from judge.config.json), and when files are added or
    changed it:

      1. Creates a timestamped run folder under resultsPath (e.g. Results/run-20260903-142530).
      2. Copies the current submissions into that run's 'intake' subfolder for an
         immutable record.
      3. Writes run-manifest.json describing what to evaluate.
      4. Prints the exact chat command to run so a human kicks the AI evaluation.

    This keeps the deterministic file handling automated while a human triggers the
    AI judging step. For fully unattended cloud triggering, see
    docs/AUTOMATION-AND-DISTRIBUTION.md.

.PARAMETER Once
    Process the current submissions once and exit (no watching). Useful for a
    scheduled task or a manual "stage a run now".

.EXAMPLE
    ./Watch-Submissions.ps1
    ./Watch-Submissions.ps1 -Once
#>
[CmdletBinding()]
param(
    [switch]$Once
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

$submissionsPath = Resolve-ConfiguredPath $config.submissionsPath
$resultsPath = Resolve-ConfiguredPath $config.resultsPath
$accepted = @($config.acceptedExtensions)

if (-not (Test-Path -LiteralPath $submissionsPath)) {
    Write-Error "Submissions path not found: $submissionsPath"
    exit 1
}

function New-Run {
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $runFolder = Join-Path $resultsPath "$($config.resultsRunPrefix)-$stamp"
    $intake = Join-Path $runFolder 'intake'
    New-Item -ItemType Directory -Path $intake -Force | Out-Null

    $files = Get-ChildItem -LiteralPath $submissionsPath -File |
        Where-Object { $accepted -contains $_.Extension.ToLowerInvariant() }

    if (-not $files) {
        Write-Host "No accepted submissions found in $submissionsPath. Nothing to stage."
        Remove-Item -LiteralPath $runFolder -Recurse -Force
        return
    }

    foreach ($file in $files) { Copy-Item -LiteralPath $file.FullName -Destination $intake -Force }

    $manifest = [ordered]@{
        runId          = "$($config.resultsRunPrefix)-$stamp"
        createdUtc     = (Get-Date).ToUniversalTime().ToString('o')
        submissionsPath = $submissionsPath
        intakePath     = $intake
        resultsPath    = $runFolder
        submissions    = @($files | ForEach-Object { $_.Name })
    }
    $manifest | ConvertTo-Json -Depth 5 | Set-Content -Path (Join-Path $runFolder 'run-manifest.json') -Encoding UTF8

    Write-Host ''
    Write-Host "Staged run: $runFolder"
    Write-Host "Submissions ($($files.Count)): $($manifest.submissions -join ', ')"
    Write-Host ''
    Write-Host "NEXT STEP (a human runs the AI judging): open VS Code chat in this repo and type:"
    Write-Host "    /judge-proposals" -ForegroundColor Cyan
    Write-Host "and tell the orchestrator to write results into: $runFolder"
    Write-Host ''
}

New-Run

if ($Once) { return }

Write-Host "Watching $submissionsPath for new submissions. Press Ctrl+C to stop."
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $submissionsPath
$watcher.IncludeSubdirectories = $false
$watcher.NotifyFilter = [System.IO.NotifyFilters]::FileName -bor [System.IO.NotifyFilters]::LastWrite
$watcher.EnableRaisingEvents = $true

try {
    while ($true) {
        $change = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::Created -bor [System.IO.WatcherChangeTypes]::Changed, 60000)
        if ($change.TimedOut) { continue }
        Start-Sleep -Seconds 2  # let the file finish writing
        Write-Host "Detected change: $($change.Name)"
        New-Run
    }
}
finally {
    $watcher.EnableRaisingEvents = $false
    $watcher.Dispose()
}
