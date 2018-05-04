Set-StrictMode -Version Latest
function Hoge{
    "Localスコープ. hoge : $($local:hoge)"
    "スコープなし. fuga : $($fuga)"
}

$hoge = 1
$fuga = 2
Hoge