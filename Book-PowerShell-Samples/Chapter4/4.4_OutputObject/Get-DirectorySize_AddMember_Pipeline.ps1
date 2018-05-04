#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./"
)

$date = Get-Date
$measure = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File | Measure-Object -Sum Length
$output = New-Object -TypeName PSObject
$output | Add-Member -MemberType NoteProperty -Name Name -Value $date -PassThru |
    Add-Member -MemberType NoteProperty -Name Path -Value $LiteralPath -PassThru |
    Add-Member -MemberType NoteProperty -Name FileCount -Value $measure.Count -PassThru |
    Add-Member -MemberType NoteProperty -Name Sum -Value $measure.Sum
Write-Output $output
