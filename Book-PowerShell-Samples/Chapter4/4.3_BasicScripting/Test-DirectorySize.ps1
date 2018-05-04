#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./",
    [int]$Size = 0
)

$directorySize = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File |
    Measure-Object -Sum Length |
    ForEach-Object Sum

return $directorySize -ge $Size