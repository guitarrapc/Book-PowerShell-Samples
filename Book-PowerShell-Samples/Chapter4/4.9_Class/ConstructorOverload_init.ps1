class Foo{
    [string]$Name
    [int]$Id
    
    Foo(){
        $this.Init()
    }
    Foo([string]$name){
        $this.Init($name)
    }
    Foo([string]$name, [int]$id){
        $this.Init($name, $id)
    }

    hidden Init([string]$name, [int]$id){
        $this.Name = $name
        $this.Id = $id
    }
    hidden Init([string]$name){
        $this.Init($name, 10)
    }
    hidden Init(){
        $this.Init("piyo", 10)
    }
}