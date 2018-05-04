#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./"
)

$date = Get-Date
$measure = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File | Measure-Object -Sum Length
$property = @{
	Date = $date
    Path = $LiteralPath
    FileCount = $measure.Count
    Sum = $measure.Sum
}
$output = New-Object -TypeName PSObject -Property $property
Write-Output $output