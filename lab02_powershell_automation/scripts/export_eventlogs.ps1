<#
.SYNOPSIS
    Export Windows Event Logs with rotation.
#>

[CmdletBinding()]
param(
    [string[]]$Logs = @("System","Application","Security"),
    [int]$Days = 7,
    [string]$OutDir = ".\logs\eventlogs"
)

$ErrorActionPreference = "Stop"
$ts = Get-Date -Format "yyyyMMdd_HHmmss"
New-Item -ItemType Directory -Path $OutDir -Force | Out-Null

$start = (Get-Date).AddDays(-1 * $Days)

foreach ($log in $Logs) {
    $out = Join-Path $OutDir "$($log)_$ts.evtx"
    try {
        wevtutil epl $log $out /q:"*[System[TimeCreated[@SystemTime>='$($start.ToUniversalTime().ToString("o"))']]]"
        Write-Host "Exported $log to $out"
    } catch {
        Write-Warning "Failed to export $log: $_"
    }
}

# Simple rotation: keep last 10 exports
Get-ChildItem -Path $OutDir -Filter "*.evtx" | Sort-Object LastWriteTime -Descending | Select-Object -Skip 10 | Remove-Item -Force -ErrorAction SilentlyContinue
