using namespace System.Collections.Generic
using namespace System.Linq
using namespace System.Text

[Enumerable]::Where(([List[int]](1..10)), [Func[int, bool]]{
  param ([int] $p)
  return $p -eq 2
})

$range = [Enumerable]::Range(1,10)
[Enumerable]::Where($range, [Func[int, bool]]{
  param ([int] $p)
  return $p % 2 -eq 0
})