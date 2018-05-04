function Foo {
    $n = 1
    {
        ""
        $n += 1
        Write-Output $n
    }.GetNewClosure()
}
$func = foo
$n = 0

& $func # 2
& $func # 2