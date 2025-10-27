[CmdletBinding()]
param(
  [string[]]$Hosts = @('10.10.10.1','10.10.10.10','10.10.20.1','10.10.20.50','10.10.99.1','10.10.99.50'),
  [string]$OutDir = 'C:\Lab02_Basics\Logs'
)
$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $OutDir)) { New-Item -ItemType Directory -Path $OutDir -Force | Out-Null }
$ts = Get-Date -Format 'yyyyMMdd_HHmmss'
$csv = Join-Path $OutDir ("ping_results_{0}.csv" -f $ts)
$json = Join-Path $OutDir ("ping_results_{0}.json" -f $ts)
$results = foreach ($h in $Hosts) {
  $ok = $false
  try { $ok = Test-Connection -ComputerName $h -Count 2 -Quiet -ErrorAction Stop } catch {}
  [pscustomobject]@{ Host=$h; Reachable=[bool]$ok; Timestamp=(Get-Date) }
}
$results | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $csv
$results | ConvertTo-Json | Out-File $json -Encoding UTF8
Write-Host "Saved: $csv"
Write-Host "Saved: $json"