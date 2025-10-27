[CmdletBinding()]
param([int]$Hours = 24, [string]$OutDir = 'C:\Lab02_Basics\Logs')
$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $OutDir)) { New-Item -ItemType Directory -Path $OutDir -Force | Out-Null }
$since = (Get-Date).AddHours(-1 * $Hours)
$ts = Get-Date -Format 'yyyyMMdd_HHmmss'
$outFile = Join-Path $OutDir ("eventlog_summary_{0}.txt" -f $ts)
"System Log Errors since $since" | Out-File -FilePath $outFile -Encoding UTF8
"------------------------------------------------------------" | Out-File -Append $outFile -Encoding UTF8
try {
  $events = Get-WinEvent -FilterHashtable @{ LogName='System'; Level=2; StartTime=$since } -ErrorAction Stop | Select TimeCreated, Id, ProviderName, Message -First 50
} catch {
  $events = Get-EventLog -LogName System -EntryType Error -After $since | Select @{n='TimeCreated';e={$_.TimeGenerated}}, @{n='Id';e={$_.EventID}}, @{n='ProviderName';e={$_.Source}}, Message -First 50
}
foreach ($e in $events) {
  "[$($e.TimeCreated)] Id=$($e.Id) Source=$($e.ProviderName)`n$($e.Message)`n" | Out-File -Append $outFile -Encoding UTF8
}
Write-Host "Saved: $outFile"