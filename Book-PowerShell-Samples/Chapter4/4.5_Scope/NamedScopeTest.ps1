Set-StrictMode -Version Latest
function GetScopeVariable{
    Write-Host "[開始]#GetScopeVariable関数の中に入りました。" -ForegroundColor cyan
    Write-Host "[取得($($variable -eq "Script"))] : 変数を親スコープから取得します。variable : $variable" -ForegroundColor cyan
    Write-Host "[取得($($local:local -eq "Script:local"))] : local変数を親スコープから取得できませんでした。local:local : $local:local" -ForegroundColor cyan
    Write-Host "[取得($($private:private -eq "Script:private"))] : private変数を親スコープから取得できませんでした。private:private : $private:private" -ForegroundColor cyan
    Write-Host "[取得($($script:script -eq "Script:script"))] : script変数を親スコープから取得します。script:scipt : $script:script" -ForegroundColor cyan
    Write-Host "[取得($($global:global -eq "Script:global"))] : global変数を親スコープから取得します。global:global : $global:global" -ForegroundColor cyan
    Write-Host "[終了]#GetScopeVariable関数を抜けます" -ForegroundColor cyan
}

function SetScopeVariable{
    Write-Host "[開始]#SetScopeVariable関数の中に入りました。" -ForegroundColor Green
    $variable = "Function"
    Write-Host "[設定($($variable -eq "Function"))] : 変数を関数で設定しました。variable : $variable" -ForegroundColor Green
    $local:local = "Function:local"
    Write-Host "[設定($($local:local -eq "Function:local"))] : local変数を関数で設定しました。local:local : $local:local" -ForegroundColor Green
    $private:private = "Function:private"
    Write-Host "[設定($($private:private -eq "Function:private"))] : private変数を関数で設定しました。private:private : $private:private" -ForegroundColor Green
    $script:script = "Function:script"
    Write-Host "[設定($($script:script -eq "Function:script"))] : script変数を関数で設定しました。script:script : $script:script" -ForegroundColor Green
    $global:global = "Function:global"
    Write-Host "[設定($($global:global -eq "Function:global"))] : global変数を関数で設定しました。global:global : $global:global" -ForegroundColor Green
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
$local:local = "Script:local"
Write-Host "[取得($($local:local -eq "Script:local"))] : local変数を設定しました。local:local : $local:local"
$private:private = "Script:private"
Write-Host "[取得($($private:private -eq "Script:private"))] : private変数を設定しました。private:private : $private:private"
$script:script = "Script:script"
Write-Host "[設定($($script:script -eq "Script:script"))] : script変数を設定しました。script:script : $script:script"
$global:global = "Script:global"
Write-Host "[取得($($global:global -eq "Script:global"))] : grobal変数を設定しました。global:global : $global:global"
GetScopeVariable
SetScopeVariable
Write-Host "[取得($($variable -eq "Script"))] : 変数は書き換わっていません。variable : $variable"
Write-Host "[取得($($local:local -eq "Script:local"))] : 変数は書き換わっていません。local : $local:local"
Write-Host "[取得($($private:private -eq "Script:private"))] : 変数は書き換わっていません。private : $private:private"
Write-Host "[取得($($script:script -eq "Script:script"))] : 変数が書き換わっています。script : $script:script"
Write-Host "[取得($($global:global -eq "Script:global"))] : 変数が書き換わっています。global : $global:global"

Write-Host "------------------------------"

New-Alias -Name hoge -Value Get-Date -Force
Write-Host "[設定($($alias:hoge -eq "Get-Date"))] : エイリアスを設定しました。hoge : $($alias:hoge)"
GetAlias
SetAlias
Write-Host "[実行($($alias:hoge -eq "Get-Date"))] : エイリアスを検索します。hoge : $($alias:hoge)"

Write-Host "[終了] : #ScopeTestスクリプト"
