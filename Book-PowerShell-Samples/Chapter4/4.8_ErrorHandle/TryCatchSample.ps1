try {
    Write-Host "try : 処理開始"
    Get-Process hasdfa -ErrorAction Stop
    Write-Host "try : 処理終了"
}
catch {
    Write-Host "catch : 例外処理 $_"
}