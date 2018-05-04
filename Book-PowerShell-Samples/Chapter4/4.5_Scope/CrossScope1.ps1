function Child{
    Write-Host "Child関数に入りました. $var : $var"
    $var = 3
    Write-Host "Child関数で設定されました. $var : $var"
}

Write-Host "CrossScope1に入りました. $var : $var"
$var = 2
Write-Host "CrossScope1で設定されました. $var : $var"
Child
Write-Host "CrossScope1に戻りました. $var : $var"