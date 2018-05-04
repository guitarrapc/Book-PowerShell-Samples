$now = Get-Date
$uptime = Get-Uptime

Write-Host "日付               : $($now.DateTime)"
Write-Host "OS                 : $($psVersionTable.OS)"
Write-Host "プラットフォーム   : $($psVersionTable.Platform)"
Write-Host "PowerShell Version : $($psVersionTable.PSVersion)"
Write-Host "PowerShell Edition : $($psVersionTable.PSEdition)"
Write-Host "起動時間           : $([int]$uptime.TotalMinutes)分"