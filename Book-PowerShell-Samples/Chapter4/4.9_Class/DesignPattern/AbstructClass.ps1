class Foo {
    Foo() {
        $type = $this.GetType()
        if ($type -eq [Foo]) {
            throw("Class $type must be inherited")
        }
    }
    [string] Hello() {
        throw("Must Override Method")
    }
}

class Bar : Foo {
    Bar() {
    }

    [string] Hello() {
        return "Hello"
    }
}
