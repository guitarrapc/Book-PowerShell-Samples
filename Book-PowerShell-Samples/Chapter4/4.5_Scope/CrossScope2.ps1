function Child{
    Write-Host "Child関数に入りました. $var : $var"
    Set-Variable -Name var -Value 3 -Scope 2
    Write-Host "Child関数で設定されました. $var : $var"
}

Write-Host "CrossScope1に入りました. $var : $var"
Set-Variable -Name var -Value 2 -Scope 1
Write-Host "CrossScope1で設定されました. $var : $var"
Child
Write-Host "CrossScope1に戻りました. $var : $var"