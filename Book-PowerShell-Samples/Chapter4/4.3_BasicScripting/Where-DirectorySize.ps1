#!/usr/bin/env pwsh

param(
    [int]$DirectorySize
)
process {
    if ($_ -gt $DirectorySize) {
        Write-Output $_
    }
}
