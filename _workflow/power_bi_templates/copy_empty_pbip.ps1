param(
    [Parameter(Mandatory = $true)]
    [string]$ProjectName,

    [string]$WorkspaceRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..\..")).Path
)

$ErrorActionPreference = "Stop"

if ($ProjectName -notmatch "^[A-Za-z0-9_-]{1,64}$") {
    throw "ProjectName must use A-Z, a-z, 0-9, underscore, or hyphen, max 64 characters."
}

function Get-FullPath {
    param([string]$Path)
    return [System.IO.Path]::GetFullPath($Path)
}

function Assert-WithinRoot {
    param(
        [string]$Path,
        [string]$Root
    )
    $fullPath = Get-FullPath $Path
    $fullRoot = (Get-FullPath $Root).TrimEnd([System.IO.Path]::DirectorySeparatorChar)
    if (-not ($fullPath -eq $fullRoot -or $fullPath.StartsWith($fullRoot + [System.IO.Path]::DirectorySeparatorChar))) {
        throw "Refusing to write outside workspace root: $fullPath"
    }
}

function Write-JsonFile {
    param(
        [string]$Path,
        [object]$Payload
    )
    $Payload | ConvertTo-Json -Depth 50 | Set-Content -LiteralPath $Path -Encoding utf8
}

$templateRoot = Join-Path $PSScriptRoot "empty_pbip"
$projectRoot = Join-Path (Join-Path $WorkspaceRoot "projects") $ProjectName
$phaseRoot = Join-Path $projectRoot "05_power_bi_development"
$targetRoot = Join-Path $phaseRoot "power_bi_project"

Assert-WithinRoot -Path $targetRoot -Root $WorkspaceRoot

if (-not (Test-Path -LiteralPath $templateRoot)) {
    throw "Empty PBIP template not found: $templateRoot"
}

if (-not (Test-Path -LiteralPath $projectRoot)) {
    throw "Project folder not found: $projectRoot"
}

if (Test-Path -LiteralPath $targetRoot) {
    throw "Power BI project folder already exists: $targetRoot"
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null
Get-ChildItem -LiteralPath $templateRoot -Force | Copy-Item -Destination $targetRoot -Recurse -Force
Get-ChildItem -LiteralPath $targetRoot -Recurse -Force | ForEach-Object {
    $_.Attributes = $_.Attributes -band (-bnot [System.IO.FileAttributes]::ReadOnly)
}

$oldPbip = Join-Path $targetRoot "EmptyPowerBI.pbip"
$oldReport = Join-Path $targetRoot "EmptyPowerBI.Report"
$oldModel = Join-Path $targetRoot "EmptyPowerBI.SemanticModel"
$newPbip = Join-Path $targetRoot "$ProjectName.pbip"
$newReport = Join-Path $targetRoot "$ProjectName.Report"
$newModel = Join-Path $targetRoot "$ProjectName.SemanticModel"

Rename-Item -LiteralPath $oldReport -NewName "$ProjectName.Report" -Force
Rename-Item -LiteralPath $oldModel -NewName "$ProjectName.SemanticModel" -Force
Rename-Item -LiteralPath $oldPbip -NewName "$ProjectName.pbip" -Force

$pbip = Get-Content -Raw -LiteralPath $newPbip | ConvertFrom-Json
$pbip.artifacts[0].report.path = "$ProjectName.Report"
Write-JsonFile -Path $newPbip -Payload $pbip

$pbirPath = Join-Path $newReport "definition.pbir"
$pbir = Get-Content -Raw -LiteralPath $pbirPath | ConvertFrom-Json
$pbir.datasetReference.byPath.path = "../$ProjectName.SemanticModel"
Write-JsonFile -Path $pbirPath -Payload $pbir

$reportPlatformPath = Join-Path $newReport ".platform"
$reportPlatform = Get-Content -Raw -LiteralPath $reportPlatformPath | ConvertFrom-Json
$reportPlatform.metadata.displayName = $ProjectName
$reportPlatform.config.logicalId = [guid]::NewGuid().ToString()
Write-JsonFile -Path $reportPlatformPath -Payload $reportPlatform

$modelPlatformPath = Join-Path $newModel ".platform"
$modelPlatform = Get-Content -Raw -LiteralPath $modelPlatformPath | ConvertFrom-Json
$modelPlatform.metadata.displayName = $ProjectName
$modelPlatform.config.logicalId = [guid]::NewGuid().ToString()
Write-JsonFile -Path $modelPlatformPath -Payload $modelPlatform

[pscustomobject]@{
    ProjectName = $ProjectName
    PowerBIProjectFolder = $targetRoot
    Pbip = $newPbip
    Report = $newReport
    SemanticModel = $newModel
}
