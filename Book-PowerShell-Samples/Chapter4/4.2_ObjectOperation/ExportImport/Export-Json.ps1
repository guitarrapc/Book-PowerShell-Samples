$customObject | ConvertTo-Json | Out-File test.json
Get-Content -Path ./test.json
Get-Content -Raw ./test.json | ConvertFrom-Json