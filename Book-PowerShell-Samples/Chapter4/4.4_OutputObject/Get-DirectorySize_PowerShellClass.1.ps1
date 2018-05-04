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
$property = @{
	Date = $date
    Path = $LiteralPath
    FileCount = $measure.Count
    Sum = $measure.Sum
}
$output = New-Object -TypeName MyClass2 -Property $property
Write-Output $output
