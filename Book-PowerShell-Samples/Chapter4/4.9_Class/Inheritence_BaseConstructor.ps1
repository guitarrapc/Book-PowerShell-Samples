class Person {
    [string]$Name
    [int]$Age

    Person([string]$name, [int]$age) {
        $this.Name = $name
        $this.Age = $age
    }

    [string] Hello(){
        return ("{0} : {1}" -f $this.Name, $this.Age)
    }
}

class Student : Person {
    [int]$Id
    Student([string]$name, [int]$age) : base($name, $age){
    }
}