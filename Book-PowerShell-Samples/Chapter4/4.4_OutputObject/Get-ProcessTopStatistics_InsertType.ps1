$processes = Get-Process | Group-Object Name | Sort-Object -Property Count -Descending -Top 10

$processObjects = @()
foreach ($item in $processes) {
    $cpu = [PSCustomObject]@{
        MaxCPU = ($item.Group | Measure-Object -Property CPU -Maximum).Maximum
        AllCPU = , @($item.Group.CPU)
    }
    $vm = [PSCustomObject]@{
        AvgVM = ($item.Group | Measure-Object -Property VM -Average).Average
        AllVM = , @($item.Group.VM)
    }
    $processResult = [pscustomobject]@{
        Name     = $item.Name
        Count    = $item.Count
        CPUStats = $cpu
        VMStats  = $vm
    }
    $processResult.PSTypeNames.Insert(0, "My.Nice.Type")
    $processObjects += $processResult
}
Write-Output @($processObjects)