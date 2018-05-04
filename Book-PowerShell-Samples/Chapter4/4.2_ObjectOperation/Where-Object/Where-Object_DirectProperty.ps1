Get-Process | Where-Object {$_.Name -eq "pwsh"}
Get-Process | Where-Object Name -eq pwsh