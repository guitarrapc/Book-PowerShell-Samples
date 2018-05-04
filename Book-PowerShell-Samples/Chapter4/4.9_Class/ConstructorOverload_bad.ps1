class Foo{
    [string]$Name
    [int]$Id
    
    Foo(){
    }
    Foo([string]$name){
        $this.Name = $name
    }
    Foo([string]name, [int]$id) :this($name){
        $this.Id = $id
    }
}