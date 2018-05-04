trap{
    Write-Host "Trapの中です $_"
    continue
}

Write-Host "処理開始"
Get-Process hogemogfugafuga -ErrorAction Stop
Write-Host "処理終了"