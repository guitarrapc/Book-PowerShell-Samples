using namespace Microsoft.PowerShell.SHiPS

Enum PlanetName{
    Mercury
    Venus
    Earth
    Mars
}

Enum EarthMoon{
    Luna
}
Enum MarsMoon{
    Deimos
    Phobos
}
Enum PlanetKind{
    Planet
    Moon
}

class PlanetData {
    [int]$No
    [string]$Japanese

    PlanetData([int]$no, [string]$japanese) {
        $this.No = $no
        $this.Japanese = $japanese
    }
}

class MoonData {
    [int]$No
    [string]$Japanese

    MoonData([string]$no, [string]$japanese) {
        $this.No = $no
        $this.Japanese = $japanese
    }
}

class SolarSystem : SHiPSDirectory {    
    hidden static [Planet[]]$planets

    SolarSystem() : base($this.GetType()) {
        $this.Init()
    }

    SolarSystem([string]$name): base($name) {
        $this.Init()
    }

    hidden [void] Init() {
        [SolarSystem]::planets += [Planet]::new([PlanetName]::Mercury, [PlanetData]::new(1, "水星"))
        [SolarSystem]::planets += [Planet]::new([PlanetName]::Venus, [PlanetData]::new(2, "金星"))
        [SolarSystem]::planets += [Planet]::new([PlanetName]::Earth, [PlanetData]::new(3, "地球"))
        [SolarSystem]::planets += [Planet]::new([PlanetName]::Mars, [PlanetData]::new(4, "火星"))
    }

    [object[]] GetChildItem() {
        return [SolarSystem]::planets
    }
}

class Planet : SHiPSDirectory {
    [string]$Name
    [PlanetData]$Data
    [PlanetName]$PlanetName
    static [PlanetKind]$Type = [PlanetKind]::Planet

    hidden [Moon[]]$Moons

    Planet([string]$name) : base($name) {
        $this.Name = $name
        $this.PlanetName = [PlanetName]$this.Name
        $this.InitMoons($this.PlanetName)
    }

    Planet([string]$name, [PlanetData]$data) : base($name) {
        $this.Name = $name
        $this.Data = $data
        $this.PlanetName = [PlanetName]$this.Name
        $this.InitMoons($this.PlanetName)
    }

    hidden [void] InitMoons([PlanetName]$planetName) {
        switch ($planetName) {
            {$_ -eq [PlanetName]::Earth} { 
                if ($null -eq $this.Moons) {
                    Write-Verbose "Create cache"
                    $this.Moons = [Moon]::new([EarthMoon]::Luna, [MoonData]::new(1, "月"))
                }
            }
            {$_ -eq [PlanetName]::Mars} { 
                if ($null -eq $this.Moons) {
                    Write-Verbose "Create cache"
                    $this.Moons += [Moon]::new([MarsMoon]::Deimos, [MoonData]::new(1, "デイモス"))
                    $this.Moons += [Moon]::new([MarsMoon]::Phobos, [MoonData]::new(2, "フォボス"))
                }
            }
            Default {
                Write-Verbose "$planetName does not have moon."
                $this.Moons = @()
            }
        }
    }

    [object[]] GetChildItem() {
        return $this.Moons
    }
}

class Moon : SHiPSLeaf {
    [string]$Name
    [MoonData]$Data
    static [PlanetKind]$Type = [PlanetKind]::Moon

    Moon([string]$name) : base($name) {
        $this.Name = $name
    }

    Moon([string]$name, [MoonData]$data) : base($name) {
        $this.Name = $name
        $this.Data = $data
    }
}

# Import-Module ships
# Import-Module .SolarSystem.psm1
#New-PSDrive -Name ss -PSProvider SHiPS -Root 'SolarSystem#SolarSystem'
#Remove-PSDrive -Name ss