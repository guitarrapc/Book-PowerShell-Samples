using namespace System.Linq
using namespace System.Threading.Tasks

class Singleton {
    static [Singleton] $Instance
    [Guid]$Guid = [Guid]::NewGuid()

    hidden Singleton(){
    }

    static [Singleton] GetInstance() {
        if ([Singleton]::Instance -eq $null) {
            [Singleton]::Instance = [Singleton]::new()
        }
        return [Singleton]::Instance
    }
}

$range = [Enumerable]::Range(0,1000)
[Enumerable]::Select($range, [Func[int, Guid]]{
    param([int]$x)
    [Singleton]::GetInstance().Guid
})