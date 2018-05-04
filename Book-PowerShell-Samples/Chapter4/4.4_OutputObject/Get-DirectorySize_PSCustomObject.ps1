#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./"
)

$date = Get-Date
$measure = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File | Measure-Object -Sum Length
$output = [pscustomobject]@{
	Date = $date
    Path = $LiteralPath
    FileCount = $measure.Count
    Sum = $measure.Sum
}
Write-Output $output