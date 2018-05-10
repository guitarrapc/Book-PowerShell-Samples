$url = "https://google.com"
$validStatusCode = 200
$logFile = "./StatusCheck.log" 
while ($true) {
    #ステータスコードを取得する
    $statusCode = try {
        (Invoke-WebRequest -Uri $url).StatusCode
    }
    catch {
        $_.Exception.GetBaseException().Response.StatusCode.Value__
    }
    #ステータスコードが200かどうか確認する
    if ($statusCode -ne $validStatusCode) {
        #ログファイルがあるかを確認する
        if (-not(Test-Path $logFile)) {
            #ログファイルを作る
            New-Item -Path $logFile
        }

        #ファイルは後からコマンドから読みやすいようにJSONとする
        $json = [ordered]@{
            Date       = (Get-Date).ToString("F")
            Url        = $url
            StatusCode = $statusCode
        } | ConvertTo-Json -Compress

        #1分ごとに繰り返す
        $json | Out-File -LiteralPath $logFile -Append
    }
    # 60秒停止する
    Start-Sleep -Seconds 60
}