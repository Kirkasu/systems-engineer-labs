<#
.SYNOPSIS
    Check and (optionally) restart critical services; log status to CSV/JSON.
#>

[CmdletBinding()]
param(
    [string[]]$Services = @("W32Time","Spooler","LanmanServer","MpsSvc"),
    [switch]$AutoRestart,
    [string]$OutDir = ".\logs"
)

$ErrorActionPreference = "Stop"
$ts = Get-Date -Format "yyyyMMdd_HHmmss"
New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
$csvPath = Join-Path $OutDir "service_health_$ts.csv"
$jsonPath = Join-Path $OutDir "service_health_$ts.json"

$results = foreach ($s in $Services) {
    $svc = Get-Service -Name $s -ErrorAction SilentlyContinue
    if (-not $svc) {
        [pscustomobject]@{ Service=$s; Present=$false; Status="N/A"; Action="None"; Timestamp=$ts }
        continue
    }
    $action = "None"
    if ($AutoRestart -and $svc.Status -ne 'Running') {
        try { Restart-Service -Name $s -ErrorAction Stop; $action="Restarted" }
        catch { $action="RestartFailed" }
        $svc = Get-Service -Name $s
    }
    [pscustomobject]@{ Service=$s; Present=$true; Status=$svc.Status; Action=$action; Timestamp=$ts }
}

$results | Export-Csv -NoTypeInformation -Path $csvPath -Encoding UTF8
$results | ConvertTo-Json | Out-File $jsonPath -Encoding utf8
Write-Host "Wrote $csvPath and $jsonPath"
