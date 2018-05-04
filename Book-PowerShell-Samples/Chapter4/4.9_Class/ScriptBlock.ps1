function Foo {
    $n = 1
    {
        ""
        $n += 1
        Write-Output $n
    }
}
$func = foo
$n = 0

& $func # 1
& $func # 1