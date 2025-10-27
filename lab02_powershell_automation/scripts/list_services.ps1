[CmdletBinding()]
param([string]$OutDir = 'C:\Lab02_Basics\Logs')
$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $OutDir)) { New-Item -ItemType Directory -Path $OutDir -Force | Out-Null }
$ts = Get-Date -Format 'yyyyMMdd_HHmmss'
$outFile = Join-Path $OutDir ("services_{0}.csv" -f $ts)
Get-Service | Select Name, Status, StartType, DisplayName | Sort Status, Name | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $outFile
Write-Host "Saved: $outFile"