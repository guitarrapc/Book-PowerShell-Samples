function Foo {
    $n = 1
    {
        $n += 1
        $i += 1
        Write-Host($i)
        Write-Output $n
    }.GetNewClosure()
}
$func = foo
$n = 0

& $func # 2 (期待は2)
& $func # 2 (期待は3)