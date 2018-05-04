$customObject | ConvertTo-Json -Compress | Out-File compress.json
Get-Content -Path ./compress.json
Get-Content ./compress.json | ConvertFrom-Json