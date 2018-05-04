#!/usr/bin/env pwsh

function Where-DirectorySize {
    param(
        [int]$DirectorySize
    )
    process {
        if ($_ -gt $DirectorySize) {
            Write-Output $_
        }
    }
}
    