Get-Process | Measure-Object -Sum Id
Get-Process | Measure-Object -Property Id -Sum -Average -Maximum -Minimum