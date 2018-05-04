$closure = {
    param ([int] $x)
    $sum = {
        param ([int] $y)
        return ($x + $y)
    }.GetNewClosure()
    return $sum
}

Set-Item -Path "Function:Add" -Value $closure

$add5 = Add 5
$add10 = Add 10

& $add5 3
& $add10 -5
& $(Add 2) 5