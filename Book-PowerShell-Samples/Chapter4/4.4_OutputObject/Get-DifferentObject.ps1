Get-Process | Select-Object -Property CPU, ID -First 1
Get-Process | Select-Object -Property Name -First 1
Get-Process | Select-Object -Property CompanyName, Description, MainModule -First 1
