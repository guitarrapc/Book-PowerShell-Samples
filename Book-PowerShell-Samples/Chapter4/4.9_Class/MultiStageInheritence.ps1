class Person {
    [string]$Name # フィールドはPublic扱いで、PrivateやReadOnlyにはできない
    [int]$Age
   
    Person([string]$name, [int]$age) {
        $this.Name = $name
        $this.Age = $age
    }
}

# クラスの継承
class Student : Person {
    [int]$Id
  
    # 基底クラスのコンストラクター呼び出し
    Student([string]$name, [int]$age, [int]$id) : base($name, $age) {
        $this.Id = $id
    }
}

# 多段継承
class Seventeen : Student {
    [bool]$IsReal # Get Onlyプロパティの設定や、Privateアクセス修飾子がない

    Seventeen([string]$name, [int]$age, [int]$id) : base($name, $age, $id) {
        # Get Onlyプロパティの代わりにコンストラクターで設定する
        $this.IsReal = $this.Age -eq 17
    }
}