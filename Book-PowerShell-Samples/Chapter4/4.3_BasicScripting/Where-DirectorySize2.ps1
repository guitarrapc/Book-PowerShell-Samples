#!/usr/bin/env pwsh

param(
    [scriptblock]$Condition
)
process {
    if ($Condition.Invoke()) {
        Write-Output $_        
    }
}
