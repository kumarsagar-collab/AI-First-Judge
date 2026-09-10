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

.PARAMETER TeamName
    Optional immediate team-folder name or loose-file basename to stage from the
    submissions root. The full root is retained for source-manifest validation.

.PARAMETER ResultsPath
    Optional override for the results root. Defaults to config resultsPath.

.PARAMETER KnowledgePath
    Optional override for the knowledge folder. Required with SourceManifestPath
    so MCP-staged knowledge files can be verified against their provenance.

.PARAMETER SourceManifestPath
    Optional JSON manifest produced while staging files from an external source such
    as SharePoint MCP. Its contents are preserved as source in run-manifest.json.

.EXAMPLE
    ./.github/scripts/New-JudgingRun.ps1

.EXAMPLE
    # Stage only one team folder:
    ./.github/scripts/New-JudgingRun.ps1 -SubmissionsPath 'WorkShopSubmission' -TeamName 'Team A'

.EXAMPLE
    # Stage an MCP snapshot and preserve its SharePoint provenance:
    ./.github/scripts/New-JudgingRun.ps1 -KnowledgePath '.sharepoint-cache/run-1/Knowledge' -SubmissionsPath '.sharepoint-cache/run-1/Submissions' -SourceManifestPath '.sharepoint-cache/run-1/source-manifest.json'
#>
[CmdletBinding()]
param(
    [string]$SubmissionsPath,

    [string]$TeamName,

    [string]$ResultsPath,

    [string]$KnowledgePath,

    [string]$SourceManifestPath
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

function Assert-SourceManifestFolder {
    param(
        [object[]]$SourceItems,
        [string]$FolderName,
        [string]$LocalRoot,
        [string[]]$AcceptedExtensions
    )

    $stagedByPath = @{}
    foreach ($file in (Get-ChildItem -LiteralPath $LocalRoot -File -Recurse |
            Where-Object { $AcceptedExtensions -contains $_.Extension.ToLowerInvariant() })) {
        $relativePath = $file.FullName.Substring($LocalRoot.Length).TrimStart('\', '/') -replace '\\', '/'
        $stagedByPath[$relativePath.ToLowerInvariant()] = $file
    }

    $manifestByPath = @{}
    $folderPrefix = "$FolderName/"
    foreach ($item in $SourceItems) {
        $manifestPath = [string]$item.relativePath -replace '\\', '/'
        if (-not $manifestPath.StartsWith($folderPrefix, [System.StringComparison]::OrdinalIgnoreCase)) { continue }
        $relativePath = $manifestPath.Substring($folderPrefix.Length)
        $key = $relativePath.ToLowerInvariant()
        if ($manifestByPath.ContainsKey($key)) {
            throw "Duplicate $FolderName path in source manifest: $relativePath"
        }
        $manifestByPath[$key] = $item
    }

    $differences = @(
        @($stagedByPath.Keys | Where-Object { -not $manifestByPath.ContainsKey($_) } | ForEach-Object { "missing from manifest: $_" })
        @($manifestByPath.Keys | Where-Object { -not $stagedByPath.ContainsKey($_) } | ForEach-Object { "missing from snapshot: $_" })
    )
    if ($differences.Count -gt 0) {
        throw "Source manifest does not match staged ${FolderName}: $($differences -join '; ')"
    }

    foreach ($key in $stagedByPath.Keys) {
        if ([long]$manifestByPath[$key].size -ne $stagedByPath[$key].Length) {
            throw "Source manifest size does not match staged file: $($stagedByPath[$key].FullName)"
        }
    }
}

$submissionsRoot = if ($SubmissionsPath) { Resolve-ConfiguredPath $SubmissionsPath } else { Resolve-ConfiguredPath $config.submissionsPath }
$resultsRoot = if ($ResultsPath) { Resolve-ConfiguredPath $ResultsPath } else { Resolve-ConfiguredPath $config.resultsPath }
$knowledgeRoot = if ($KnowledgePath) { Resolve-ConfiguredPath $KnowledgePath } else { Resolve-ConfiguredPath $config.knowledgePath }
$accepted = @($config.acceptedExtensions)
$prefix = if ($config.PSObject.Properties.Name -contains 'resultsRunPrefix') { $config.resultsRunPrefix } else { 'run' }
$extractScript = Join-Path $PSScriptRoot 'Extract-SubmissionText.ps1'

if (-not (Test-Path -LiteralPath $submissionsRoot)) {
    Write-Error "Submissions path not found: $submissionsRoot"
    exit 1
}

if ($TeamName) {
    $matchingFolders = @(Get-ChildItem -LiteralPath $submissionsRoot -Directory |
        Where-Object { $_.Name -eq $TeamName })
    $matchingFiles = @(Get-ChildItem -LiteralPath $submissionsRoot -File |
        Where-Object {
            $accepted -contains $_.Extension.ToLowerInvariant() -and
            ($_.BaseName -eq $TeamName -or $_.Name -eq $TeamName)
        })
    if (($matchingFolders.Count + $matchingFiles.Count) -gt 1) {
        Write-Error "TeamName is ambiguous. Specify the loose filename including its extension, or rename one of the matching submissions: $TeamName"
        exit 1
    }
}

$source = $null
if ($SourceManifestPath) {
    if (-not $KnowledgePath) {
        Write-Error "KnowledgePath is required when SourceManifestPath is provided."
        exit 1
    }
    if (-not (Test-Path -LiteralPath $knowledgeRoot)) {
        Write-Error "Knowledge path not found: $knowledgeRoot"
        exit 1
    }
    $resolvedSourceManifest = Resolve-ConfiguredPath $SourceManifestPath
    if (-not (Test-Path -LiteralPath $resolvedSourceManifest)) {
        Write-Error "Source manifest not found: $resolvedSourceManifest"
        exit 1
    }
    $source = Get-Content -LiteralPath $resolvedSourceManifest -Raw | ConvertFrom-Json
    if (-not $source.PSObject.Properties.Name.Contains('provider') -or
        -not $source.PSObject.Properties.Name.Contains('items')) {
        Write-Error "Source manifest must contain provider and items properties: $resolvedSourceManifest"
        exit 1
    }

    foreach ($item in @($source.items)) {
        if (-not $item.PSObject.Properties.Name.Contains('relativePath') -or
            -not $item.PSObject.Properties.Name.Contains('size') -or
            -not $item.relativePath -or $null -eq $item.size) {
            Write-Error "Every source manifest item must contain relativePath and size: $resolvedSourceManifest"
            exit 1
        }
        $manifestPath = [string]$item.relativePath -replace '\\', '/'
        $parsedSize = 0L
        if ([System.IO.Path]::IsPathRooted($manifestPath) -or
            ($manifestPath -split '/') -contains '..' -or
            ($manifestPath -notlike 'Knowledge/*' -and $manifestPath -notlike 'Submissions/*') -or
            -not [long]::TryParse([string]$item.size, [ref]$parsedSize) -or $parsedSize -lt 0) {
            Write-Error "Invalid source manifest item: $manifestPath"
            exit 1
        }
    }

    Assert-SourceManifestFolder -SourceItems @($source.items) -FolderName 'Knowledge' -LocalRoot $knowledgeRoot -AcceptedExtensions $accepted
    Assert-SourceManifestFolder -SourceItems @($source.items) -FolderName 'Submissions' -LocalRoot $submissionsRoot -AcceptedExtensions $accepted
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$runFolder = Join-Path $resultsRoot "$prefix-$stamp"
$intake = Join-Path $runFolder 'intake'
New-Item -ItemType Directory -Path $intake -Force | Out-Null

function Get-SafeName {
    param([string]$Name)
    return ($Name -replace '[^A-Za-z0-9._-]', '_')
}

function Get-UniqueTeamName {
    param([string]$Name)
    $candidate = $Name
    $suffix = 2
    while ($usedTeamNames.ContainsKey($candidate.ToLowerInvariant())) {
        $candidate = "$Name ($suffix)"
        $suffix++
    }
    $usedTeamNames[$candidate.ToLowerInvariant()] = $true
    return $candidate
}

function Get-UniqueIntakePath {
    param([string]$TeamName)
    $baseName = Get-SafeName $TeamName
    $candidate = $baseName
    $suffix = 2
    while ($usedIntakeNames.ContainsKey($candidate.ToLowerInvariant())) {
        $candidate = "$baseName-$suffix"
        $suffix++
    }
    $usedIntakeNames[$candidate.ToLowerInvariant()] = $true
    return (Join-Path $intake "$candidate.md")
}

$teams = [System.Collections.Generic.List[object]]::new()
$usedTeamNames = @{}
$usedIntakeNames = @{}

# One intake file per team subfolder (all accepted files extracted together).
foreach ($dir in (Get-ChildItem -LiteralPath $submissionsRoot -Directory |
    Where-Object { -not $TeamName -or $_.Name -eq $TeamName })) {
    $files = @(Get-ChildItem -LiteralPath $dir.FullName -File -Recurse |
        Where-Object { $accepted -contains $_.Extension.ToLowerInvariant() } |
        Sort-Object FullName)
    if ($files.Count -eq 0) { continue }
    $resolvedTeamName = Get-UniqueTeamName $dir.Name
    $intakeFile = Get-UniqueIntakePath $resolvedTeamName
    & $extractScript -Path @($files.FullName) | Set-Content -LiteralPath $intakeFile -Encoding UTF8
    $unavailable = @(Select-String -LiteralPath $intakeFile -Pattern 'CONTENT UNAVAILABLE' -SimpleMatch).Count
    $teams.Add([ordered]@{
            name        = $resolvedTeamName
            path        = $dir.FullName
            intake      = $intakeFile
            reportFile  = ([System.IO.Path]::GetFileNameWithoutExtension($intakeFile) + '-evaluation.md')
            fileCount   = $files.Count
            files       = @($files.FullName)
            unavailable = $unavailable
        })
}

# Loose accepted files at the submissions root are single-file teams.
foreach ($file in (Get-ChildItem -LiteralPath $submissionsRoot -File |
    Where-Object {
        $accepted -contains $_.Extension.ToLowerInvariant() -and
        (-not $TeamName -or $_.BaseName -eq $TeamName -or $_.Name -eq $TeamName)
    })) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $resolvedTeamName = Get-UniqueTeamName $baseName
    $intakeFile = Get-UniqueIntakePath $resolvedTeamName
    & $extractScript -Path $file.FullName | Set-Content -LiteralPath $intakeFile -Encoding UTF8
    $unavailable = @(Select-String -LiteralPath $intakeFile -Pattern 'CONTENT UNAVAILABLE' -SimpleMatch).Count
    $teams.Add([ordered]@{
            name        = $resolvedTeamName
            path        = $file.FullName
            intake      = $intakeFile
            reportFile  = ([System.IO.Path]::GetFileNameWithoutExtension($intakeFile) + '-evaluation.md')
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
    source          = $source
    teams           = @($teams)
}
$manifest | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $runFolder 'run-manifest.json') -Encoding UTF8

Write-Output "RUN FOLDER: $runFolder"
foreach ($team in $teams) {
    $flag = if ($team.unavailable -gt 0) { " (CONTENT UNAVAILABLE x$($team.unavailable))" } else { '' }
    Write-Output ("TEAM: {0} | files={1} | intake={2}{3}" -f $team.name, $team.fileCount, $team.intake, $flag)
}
