# 1. プロセスを取得して、実行数の多いTOP10を取得
$processes = Get-Process | Group-Object Name | Sort-Object -Property Count -Descending | Select-Object -First 10

# 2. 空の配列を生成
$processObjects = @()

# 3. 1.で取得したプロセスを列挙
foreach ($item in $processes) {
    # 4. グループ化したプロセス1種類ずつにCPUとVMについて統計情報を取得
    $cpu = [PSCustomObject]@{
        MaxCPU = ($item.Group | Measure-Object -Property CPU -Maximum).Maximum
        AllCPU = , @($item.Group.CPU)
    }
    $vm = [PSCustomObject]@{
        AvgVM = ($item.Group | Measure-Object -Property VM -Average).Average
        AllVM = , @($item.Group.VM)
    }
    # 5. カスタムオブジェクトを生成
    $processResult = [pscustomobject]@{
        Name     = $item.Name
        Count    = $item.Count
        CPUStats = $cpu
        VMStats  = $vm
    }
    # 6. 配列に追記
    $processObjects += $processResult
}
# 7. 出力
Write-Output @($processObjects)