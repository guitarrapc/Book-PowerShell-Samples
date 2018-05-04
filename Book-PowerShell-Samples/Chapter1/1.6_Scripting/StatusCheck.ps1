$url = "https://google.com"
$validStatusCode = 404
while ($true) {
    #ステータスコードを取得する
    $statusCode = (Invoke-WebRequest -Uri $url).StatusCode
    #ステータスコードが200かどうか確認する
    if ($statusCode -ne $validStatusCode) {
        #ファイルがあるかを確認する
        if (-not(Test-Path ./StatusCheck.log)) {
            #StatusCheck.logファイルを作る
            New-Item -Path ./StatusCheck.log
        }

        #ファイルは後からコマンドから読みやすいようにJSONとする
        $json = [ordered]@{
            Date       = (Get-Date).ToString("F")
            Url        = $url
            StatusCode = $statusCode
        } | ConvertTo-Json -Compress

        #1分ごとに繰り返す
        $json | Out-File -LiteralPath StatusCheck.log -Append
    }
    Start-Sleep -Seconds 60
}