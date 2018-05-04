class BaseClass {
    static [int]$Count = 0
    [int] $BasePropDefaultValue = ++[BaseClass]::count
    [int] $SubConstructor

    BaseClass() {
        $this.SubConstructor = ++[BaseClass]::count
    }
}

class SubClass : BaseClass {
    [int] $SubPropDefaultValue = ++[BaseClass]::count
    [int] $BaseConstructor

    SubClass() : base() {
        $this.BaseConstructor = ++[BaseClass]::count
    }

    [void] GetResult(){
        Write-Host ('$this.SubPropDefaultValue : ' + $this.SubPropDefaultValue)
        Write-Host ('$this.BasePropDefaultValue : ' + $this.BasePropDefaultValue)
        Write-Host ('$this.SubConstructor : ' + $this.SubConstructor)
        Write-Host ('$this.BaseConstructor : ' + $this.BaseConstructor)
    }
}
$SubClass = [SubClass]::new()
$SubClass.GetResult()