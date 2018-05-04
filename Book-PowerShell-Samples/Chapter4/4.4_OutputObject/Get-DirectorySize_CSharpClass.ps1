#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./"
)

$source = @"
public class MyClass
{
    public string Date { get; set; }    
    public string Path { get; set; }
    public int FileCount { get; set; }
    public int Sum { get; set; }
}
"@
Add-Type -TypeDefinition $source -Language CSharp

$date = Get-Date
$measure = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File | Measure-Object -Sum Length
$property = @{
	Date = $date
    Path = $LiteralPath
    FileCount = $measure.Count
    Sum = $measure.Sum
}
$output = New-Object -TypeName MyClass -Property $property
Write-Output $output
