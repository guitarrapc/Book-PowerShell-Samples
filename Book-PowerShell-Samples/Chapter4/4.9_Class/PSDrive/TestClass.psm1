class HogeBase {
  [string]$Name = "fuga"
  [int]$Age = 1

  HogeBase([string]$name) {
    $this.Name = $name
  }
}

class Hoge : HogeBase {
  Hoge([string]$name) : base($name) {
    $this.Name = $name
  }

  Hoge([string]$name, [int]$age) : base($name) {
    $this.Name = $name
    $this.Age = $age
  }
}

class Planet {
  [string]$Name

  Planet() {

  }

  Planet([string]$name) {
    $this.Name = $name
  }

  [object[]] GetChildItem() {
    return @()
    #return @(Get-Moon -PlanetName $this.Name)
  }
}

class Earth : Planet {
  static [string]$PlanetName = "Earth"

  Earth () {
    $this.Name = [Earth]::PlanetName
  }

  Earth([string]$name) : base($name) {
    $this.Name = $name
  }
}


function Get-Hoge {
  return [Hoge]::new("hoge")
}

function Get-Hoge2 {
  return [Hoge]::new("hoge", 3)
}

function Get-Planet {
  return [Planet]::new("planet")
}

function Get-Earth {
  return [Earth]::new()
}

function Get-Earth2 {
  return [Earth]::new("hoge")
}

Export-ModuleMember -Function Get-Hoge, Get-Hoge2, Get-Planet, Get-Earth, Get-Earth2