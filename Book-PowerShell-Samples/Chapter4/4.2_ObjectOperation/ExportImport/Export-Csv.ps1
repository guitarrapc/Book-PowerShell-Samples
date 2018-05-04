$customObject | Export-Csv -Path test.csv
Get-Content -Path ./test.csv
Import-Csv -Path ./test.csv