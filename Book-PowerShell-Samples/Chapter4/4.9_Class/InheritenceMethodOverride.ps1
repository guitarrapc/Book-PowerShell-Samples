class Foo{
    [string]$Name

    Foo(){
        $this.Name = "Foo"
    }
    [string] GetSample(){
        return "$($this.Name) : Sample"
    }

    [string] GetSample([string]$idea){
        return "$($this.Name) : Sample $idea"
    }
}

class Bar : Foo{
    Bar(){
        $this.Name = "Bar"
    }
    [string] GetSample(){
        return "Override : Sample"
    }

    [string] GetSample([string]$idea){
        return "Override : Sample $idea"
    }
}


$foo = [Foo]::new()
$bar = [Bar]::new()
$foo.GetSample()
$bar.GetSample()