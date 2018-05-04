#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./"
)

$date = Get-Date
$measure = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File | Measure-Object -Sum Length
$output = 1 | Select-Object Date, Path, FileCount, Sum
$output.Date = $date
$output.Path = $LiteralPath
$output.FileCount = $measure.Count
$output.Sum = $measure.Sum
Write-Output $output
