function Out-Default {
    [CmdletBinding(ConfirmImpact = "Medium")]
    param
    (
        [Parameter(ValueFromPipeline = $true)]
        [System.Management.Automation.PSObject] $InputObject
    )
    begin {
        $wrappedCmdlet = $ExecutionContext.InvokeCommand.GetCmdlet("Out-Default")
        $sb = { & $wrappedCmdlet @PSBoundParameters }
        $__sp = $sb.GetSteppablePipeline()
        $__sp.Begin($pscmdlet)
    }
    process {
        # カスタム表示
        Write-Host "[Custom Out-Default] Input Value = $_, Type = $($_.GetType())"
        # パイプライン継続
        $__sp.Process($_)
    }
    end {
        $__sp.End()
    }
}