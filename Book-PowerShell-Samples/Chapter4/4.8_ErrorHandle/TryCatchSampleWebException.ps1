try {
    Write-Host "try : 処理開始"
    Invoke-RestMethod "https://www.contoso.comp/notexists" -ErrorAction Stop
    Write-Host "try : 処理終了"
}
catch [System.Net.Http.HttpRequestException], [System.Net.WebException]{
    Write-Host "catch : HttpRequestエラーの例外処理"
    # 通信のリトライや別サイト接続によるリカバリなど
}
catch {
    Write-Host "catch : 想定外のエラーが発生しました $_"
}