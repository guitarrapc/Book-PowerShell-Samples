[CmdletBinding()]
param()

function TestFunction{
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true)]
        [int]$Value
    )
    process {
        $script:total5 += $_
    }
}

foreach($item in 100,1000,10000,100000,1000000,10000000){
    $base = Measure-Command {
        $total = 0
        foreach($i in 1..$item){
            $total += $i
        }
    }

    $foreachObject = Measure-Command {
        $script:total2 = 0
        1..$item | ForEach-Object { $script:total2 += $_}
    }

    $scriptInvoke = Measure-Command {
        $script:total3 = 0
        1..$item | & {process{ $script:total3 += $_}}
    }

    $scriptDot = Measure-Command {
        $script:total4 = 0
        1..$item | . {process{ $script:total4 += $_}}
    }

    $testFunction = Measure-Command {
        $script:total5 = 0
        1..$item | TestFunction
    }

    Write-Verbose "$total-$total2-$total3-$total4-$total5"

    $base = $base.TotalSeconds
    $foreachObject = $foreachObject.TotalSeconds
    $scriptInvoke = $scriptInvoke.TotalSeconds
    $scriptDot = $scriptDot.TotalSeconds
    $testFunction = $testFunction.TotalSeconds
    "$item`t$base`t$foreachObject`t$scriptInvoke`t$scriptDot`t$testFunction"
}