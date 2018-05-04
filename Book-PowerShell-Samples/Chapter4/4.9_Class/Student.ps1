# 基底クラス
class Person {
    [string]$Name
    [int]$Age

    # コンストラクター
    Person() {
        Write-Host "Base constructor called"
    }
}

# class 派生クラス :  基底クラス  で継承する
class Student : Person {
    [int]$Id; 
  
    Student() {
        Write-Host "Derived constructor called";
    }
}