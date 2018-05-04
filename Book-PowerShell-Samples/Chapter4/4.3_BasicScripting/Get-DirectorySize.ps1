#!/usr/bin/env pwsh

param(
    [string]$LiteralPath = "./"
)
Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File |
    Measure-Object -Sum Length |
    ForEach-Object Sum