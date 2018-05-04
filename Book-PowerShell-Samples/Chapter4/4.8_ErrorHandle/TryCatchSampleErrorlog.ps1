try {
    Write-Host "try : 処理開始"
    Get-Process hasdfa -ErrorAction Stop
    Write-Host "try : 処理終了"
}
catch {
    Write-Host "catch : 例外処理 $_"
    # エラーログに例外情報を書き込み
    $errorLog = "errorLog-$((Get-Date).ToString("yyyy-MM-dd-hhmmss")).log"
    $_.Exception | Select-Object * | out-File -FilePath $errorLog -Append
}
