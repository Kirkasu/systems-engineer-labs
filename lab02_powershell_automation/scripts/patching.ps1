<#
.SYNOPSIS
    Install Windows Updates non-interactively and log results.
.DESCRIPTION
    Uses the PSWindowsUpdate module. Run in elevated PowerShell.
    Recommended: execute via Task Scheduler using a least-privileged account with local rights to install updates.
#>

[CmdletBinding()]
param(
    [string]$LogDir = ".\logs",
    [switch]$AcceptAll
)

$ErrorActionPreference = "Stop"
$ts = Get-Date -Format "yyyyMMdd_HHmmss"
New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
$transcript = Join-Path $LogDir "patch_$ts.txt"
Start-Transcript -Path $transcript

try {
    if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
        Write-Host "Installing PSWindowsUpdate module..."
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -Scope CurrentUser
        Install-Module -Name PSWindowsUpdate -Force -AllowClobber -Scope CurrentUser
    }
    Import-Module PSWindowsUpdate

    # Ensure Windows Update service running
    $wusvc = Get-Service wuauserv -ErrorAction SilentlyContinue
    if ($wusvc -and $wusvc.Status -ne 'Running') {
        Start-Service wuauserv
    }

    $params = @{
        AcceptAll = $AcceptAll.IsPresent
        Install   = $true
        IgnoreReboot = $true
        Verbose = $true
    }

    # Run updates
    Get-WindowsUpdate @params | Tee-Object -FilePath (Join-Path $LogDir "patch_results_$ts.txt")

    # Summary JSON
    $summary = @{
        Timestamp = $ts
        ComputerName = $env:COMPUTERNAME
        User = $env:USERNAME
    }
    $summary | ConvertTo-Json | Out-File (Join-Path $LogDir "patch_summary_$ts.json") -Encoding utf8
}
catch {
    Write-Error $_
    exit 1
}
finally {
    Stop-Transcript
}
