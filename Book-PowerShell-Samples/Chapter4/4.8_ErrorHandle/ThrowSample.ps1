try {
    Write-Host "try : 処理開始"
    throw "例外を意図的に起こします！"
    Write-Host "try : 処理終了"
}
catch {
    Write-Host "catch : 例外処理 $_"
}