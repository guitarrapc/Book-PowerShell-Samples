# 基底クラス
class Person {
    # staticプロパティ
    static [string]$Kind = "Human"

    # パブリックプロパティ
    [string]$Name; # 型が指定されないと[object]扱い
    [int]$Age; # ; か改行を終端に用いる

    # Hidden プロパティ
    hidden [string]$Secret

    # コンストラクター
    Person() {
    }

    # 引数ありコンストラクター
    Person([string]$name, [int]$age) {
        $this.Name = $name
        $this.Age = $age
    }

    # インスタンスメソッド
    # [返戻値の型]メソッド名（引数）で定義する
    [string] GetSecret() {
        return $this.Secret
    }

    # voidにすると値が返さないことを意味する
    [void] Hello() {
        [Console]::WriteLine("Hello $($this.Name).")
    }

    # voidにすると値が返さないことを意味する
    [void] Hello([string]$name) {
        [Console]::WriteLine("Hello $name.")
    }
    
    # Hiddenキーワードはメソッドにも付与できる
    hidden [void] SetSecret([string]$secret) {
        $this.Secret = $secret
    }

    # スタティックメソッド
    static [string] GetKind() {
        return [Person]::Kind
    }

    [string] ToString() {
        return $this.Name + "($($this.Age))"
    }
}


$foo = [Person]::new("Foo", 20)
$bar = [Person]::new("Bar", 24)
$hoge = New-Object Person -ArgumentList "Hoge", 32
$piyo = [Person]@{
    Name = "Piyo"
    Age  = 26
}
$typeName = "Person"
$tyger = New-Object $typeName -ArgumentList "tyger", 40