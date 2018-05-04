"" > hoge.text
try {
    Write-Host "try : 処理開始"
    # リソースを使う処理
    $streamWriter = New-Object System.IO.StreamWriter("hoge.text")
    $streamWriter.WriteLine("fugafuga")
    throw hogemoge
    Write-Host "try : 処理終了"
}
finally {
    Write-Host "finaly : リソースの破棄(Dispose)処理など"
    $streamWriter.Dispose()
}