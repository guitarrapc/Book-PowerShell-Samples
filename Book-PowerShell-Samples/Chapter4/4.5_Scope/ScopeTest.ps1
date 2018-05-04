function GetScopeVariable{
    Write-Host "[開始]#GetScopeVariable関数の中に入りました。" -ForegroundColor cyan
    Write-Host "[取得($($variable -eq "Script"))] : 変数を親スコープから取得します。variable : $variable" -ForegroundColor cyan
    Write-Host "[終了]#GetScopeVariable関数を抜けます" -ForegroundColor cyan
}

function SetScopeVariable{
    Write-Host "[開始]#SetScopeVariable関数の中に入りました。" -ForegroundColor Green
    $variable = "Function"
    Write-Host "[設定($($variable -eq "Function"))] : 変数を関数で設定しました。variable : $variable" -ForegroundColor Green
    Write-Host "[終了]#SetScopeVariable関数を抜けます" -ForegroundColor Green
}

function GetAlias{
    Write-Host "[開始]#GetAlias関数の中に入りました。" -ForegroundColor cyan
    Write-Host "[取得($($alias:hoge.Definition -eq "Get-Date"))] : エイリアスを親スコープから取得します。hoge : $($alias:hoge)" -ForegroundColor cyan
    Write-Host "[終了]#GetAlias関数を抜けます" -ForegroundColor cyan
}

function SetAlias{
    Write-Host "[開始]#SetAlias関数の中に入りました。" -ForegroundColor Green
    New-Alias -Name hoge -Value Get-Location -Force
    Write-Host "[設定($($alias:hoge -eq "Get-Location"))] : エイリアスを設定しました。hoge : $($alias:hoge)" -ForegroundColor Green
    Write-Host "[終了]#SetAlias関数を抜けます" -ForegroundColor Green
}

Write-Host "[開始] : #ScopeTestスクリプト"
$variable = "Script"
Write-Host "[設定($($variable -eq "Script"))] : 変数を設定しました。variable : $variable"
GetScopeVariable
SetScopeVariable
Write-Host "[取得($($variable -eq "Script"))] : 変数は書き換わっていません。variable : $variable"

Write-Host "------------------------------"

New-Alias -Name hoge -Value Get-Date -Force
Write-Host "[設定($($alias:hoge -eq "Get-Date"))] : エイリアスを設定しました。hoge : $($alias:hoge)"
GetAlias
SetAlias
Write-Host "[実行($($alias:hoge -eq "Get-Date"))] : エイリアスを検索します。hoge : $($alias:hoge)"

Write-Host "[終了] : #ScopeTestスクリプト"
