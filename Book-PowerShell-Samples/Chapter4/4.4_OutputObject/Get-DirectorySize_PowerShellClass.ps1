#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./"
)

class MyClass2
{
    [string]$Date
    [string]$Path
    [int]$FileCount
    [int]$Sum
}
$LiteralPath = "./"
$date = Get-Date
$measure = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File | Measure-Object -Sum Length
$output = [MyClass2]@{
	Date = $date
    Path = $LiteralPath
    FileCount = $measure.Count
    Sum = $measure.Sum
}
Write-Output $output
