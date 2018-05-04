class Foo{
    [string]$Name
    [int]$Id
    
    Foo(){
    }
    Foo([string]$name){
        $this.Name = $name
    }
    Foo([int]$id){
        $this.Id = $id
    }
}