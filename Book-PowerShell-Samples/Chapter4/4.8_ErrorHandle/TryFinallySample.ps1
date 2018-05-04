try {
    Write-Host "try : 処理開始"
    #何か準備
    Get-Process hasdf -ErrorAction Stop
    Write-Host "try : 処理終了"
}
finally {
    Write-Host "finaly : 準備した内容の破棄処理など"
}