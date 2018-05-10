$url = "https://google.com"
$validStatusCode = 200
while ($true) {
    #ステータスコードを取得する
    $statusCode = try {
        (Invoke-WebRequest -Uri $url).StatusCode
    }
    catch {
        $Error[0].Exception.GetBaseException().Response.StatusCode.Value__
    }
    #ステータスコードが200かどうか確認する
    if ($statusCode -eq $validStatusCode) {
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
	# 60秒停止する
    Start-Sleep -Seconds 60
}