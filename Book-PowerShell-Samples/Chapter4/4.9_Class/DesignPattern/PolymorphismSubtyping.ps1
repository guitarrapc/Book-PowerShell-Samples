class Foo {
    [string] $Item

    Foo([string]$item) {
        $this.Item = $item
    }

    [string] GetMessage() {
        return $null
    }

    [void] WriteMessage() {
        Write-Host($this.GetMessage())
    }
}

class Bar : Foo {
    Bar([string]$item): base($item) {}

    [string] GetMessage() {
        return ("{0} です" -f $this.Item)
    }
}

class Piyo : Foo {
    Piyo([string]$item): base($item) {}

    [string] GetMessage() {
        return ("{0} です" -f $this.Item)
    }
}

[Foo[]]$foos = [Bar]::new("Bar"), [Piyo]::new("Piyo")
$foos.ForEach({$_.WriteMessage()})

