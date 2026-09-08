<#
.SYNOPSIS
    Syncs judging artefacts between SharePoint Online and local staging folders.

.DESCRIPTION
    The GitHub Copilot judge agents are interactive and work against local files.
    This script bridges them to SharePoint Online so Knowledge, Submissions, and
    Results each live in their own SharePoint library folder (configured
    independently in judge.config.json under "sharepoint").

    It reads judge.config.json and, using the PnP.PowerShell module:

      - Download : pulls sharepoint.knowledgeFolder    -> knowledgePath   (local)
                   pulls sharepoint.submissionsFolder  -> submissionsPath (local)
        so the agents can ground and evaluate against local copies.

      - Upload   : pushes a finished results run folder -> sharepoint.resultsFolder
                   (a subfolder named after the run is created on SharePoint).

    Downloads and uploads recurse into subfolders, so per-team submission folders
    are preserved.

    Prerequisite: PnP.PowerShell.
        Install-Module PnP.PowerShell -Scope CurrentUser
    Interactive and device-code auth require an Entra app registration whose client
    id is set in sharepoint.clientId (PnP no longer ships a default multi-tenant app).

.PARAMETER Action
    Download (Knowledge + Submissions from SharePoint to local) or
    Upload (a local results run folder to SharePoint).

.PARAMETER ResultsRunFolder
    For -Action Upload: the local run folder to publish (e.g.
    Results/run-20260907-101500). Defaults to the newest run folder under resultsPath.

.PARAMETER Config
    Path to judge.config.json. Defaults to the repo root.

.EXAMPLE
    ./Sync-SharePoint.ps1 -Action Download

.EXAMPLE
    ./Sync-SharePoint.ps1 -Action Upload -ResultsRunFolder 'Results/run-20260907-101500'
#>
[CmdletBinding()]
param(
    [ValidateSet('Download', 'Upload')]
    [string]$Action = 'Download',

    [string]$ResultsRunFolder,

    [string]$Config
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$configPath = if ($Config) { $Config } else { Join-Path $repoRoot 'judge.config.json' }
if (-not (Test-Path -LiteralPath $configPath)) {
    Write-Error "judge.config.json not found at $configPath"
    exit 1
}
$config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json

if (-not $config.PSObject.Properties.Name.Contains('sharepoint') -or -not $config.sharepoint.enabled) {
    Write-Error "sharepoint.enabled is not true in judge.config.json. Set it and fill in the sharepoint.* folders, or use local paths without this script."
    exit 1
}
$sp = $config.sharepoint

if (-not (Get-Module -ListAvailable -Name 'PnP.PowerShell')) {
    Write-Error "PnP.PowerShell is not installed. Run: Install-Module PnP.PowerShell -Scope CurrentUser"
    exit 1
}
Import-Module PnP.PowerShell -ErrorAction Stop

function Resolve-ConfiguredPath {
    param([string]$PathValue)
    if ([System.IO.Path]::IsPathRooted($PathValue)) { return $PathValue }
    return (Join-Path $repoRoot $PathValue)
}

function Connect-Site {
    param($SharePoint)
    if (-not $SharePoint.siteUrl) { throw "sharepoint.siteUrl is empty in judge.config.json." }
    $params = @{ Url = $SharePoint.siteUrl }
    if ($SharePoint.clientId) { $params.ClientId = $SharePoint.clientId }
    if ($SharePoint.tenantId) { $params.Tenant = $SharePoint.tenantId }
    switch (($SharePoint.auth ?? 'interactive').ToLowerInvariant()) {
        'device' { $params.DeviceLogin = $true }
        default { $params.Interactive = $true }
    }
    Write-Host "Connecting to $($SharePoint.siteUrl) ..."
    Connect-PnPOnline @params
}

function Save-Folder {
    param([string]$ServerFolder, [string]$LocalFolder)
    New-Item -ItemType Directory -Path $LocalFolder -Force | Out-Null

    $files = Get-PnPFolderItem -FolderSiteRelativeUrl $ServerFolder -ItemType File -ErrorAction Stop
    foreach ($file in $files) {
        Get-PnPFile -Url $file.ServerRelativeUrl -Path $LocalFolder -FileName $file.Name -AsFile -Force | Out-Null
        Write-Host "  downloaded $($file.Name)"
    }

    $folders = Get-PnPFolderItem -FolderSiteRelativeUrl $ServerFolder -ItemType Folder -ErrorAction Stop
    foreach ($folder in $folders) {
        if ($folder.Name -in @('Forms')) { continue }
        Save-Folder -ServerFolder "$ServerFolder/$($folder.Name)" -LocalFolder (Join-Path $LocalFolder $folder.Name)
    }
}

function Send-Folder {
    param([string]$LocalFolder, [string]$ServerFolder)
    Resolve-PnPFolder -SiteRelativeUrl $ServerFolder | Out-Null
    foreach ($item in Get-ChildItem -LiteralPath $LocalFolder -Recurse -File) {
        $relative = $item.FullName.Substring($LocalFolder.Length).TrimStart('\', '/')
        $subDir = Split-Path -Parent $relative
        $targetFolder = if ($subDir) { "$ServerFolder/$($subDir -replace '\\','/')" } else { $ServerFolder }
        Resolve-PnPFolder -SiteRelativeUrl $targetFolder | Out-Null
        Add-PnPFile -Path $item.FullName -Folder $targetFolder | Out-Null
        Write-Host "  uploaded $relative"
    }
}

Connect-Site -SharePoint $sp
try {
    if ($Action -eq 'Download') {
        $knowledgeLocal = Resolve-ConfiguredPath $config.knowledgePath
        $submissionsLocal = Resolve-ConfiguredPath $config.submissionsPath

        Write-Host "Downloading Knowledge: $($sp.knowledgeFolder) -> $knowledgeLocal"
        Save-Folder -ServerFolder $sp.knowledgeFolder -LocalFolder $knowledgeLocal

        Write-Host "Downloading Submissions: $($sp.submissionsFolder) -> $submissionsLocal"
        Save-Folder -ServerFolder $sp.submissionsFolder -LocalFolder $submissionsLocal

        Write-Host ""
        Write-Host "Download complete. The agent can now ground on $knowledgeLocal and judge $submissionsLocal."
    }
    else {
        $resultsRoot = Resolve-ConfiguredPath $config.resultsPath
        if ($ResultsRunFolder) {
            $localRun = Resolve-ConfiguredPath $ResultsRunFolder
        }
        else {
            $localRun = Get-ChildItem -LiteralPath $resultsRoot -Directory |
                Sort-Object LastWriteTime -Descending | Select-Object -First 1 | ForEach-Object FullName
        }
        if (-not $localRun -or -not (Test-Path -LiteralPath $localRun)) {
            Write-Error "No results run folder to upload. Pass -ResultsRunFolder or run a judging pass first."
            exit 1
        }
        $runName = Split-Path -Leaf $localRun
        $targetFolder = "$($sp.resultsFolder)/$runName"
        Write-Host "Uploading Results: $localRun -> $targetFolder"
        Send-Folder -LocalFolder $localRun -ServerFolder $targetFolder
        Write-Host ""
        Write-Host "Upload complete: $($sp.siteUrl) / $targetFolder"
    }
}
finally {
    Disconnect-PnPOnline -ErrorAction SilentlyContinue
}
