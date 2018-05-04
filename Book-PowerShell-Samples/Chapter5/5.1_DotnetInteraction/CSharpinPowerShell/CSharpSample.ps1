$csharp = @"
using System;
using System.Linq;
using System.Collections.Generic;

public static class CSharp7Sample
{
    public static void DeconstructSample()
    {
        var (count, sum) = Tally(new[] {1,2,3,4,5});
        Console.WriteLine($"{sum}/{count}");
    }

    public static (int count, int sum) Tally(IEnumerable<int> items)
    {
        var count = 0;
        var sum = 0;
        foreach (var x in items)
        {
            sum += x;
            count++;
        }
        return (count, sum);
    }

    public static void ClassSwitch(object obj)
    {
        switch (obj)
        {
            case 7:
                Console.WriteLine("7の時だけここに来る");
                break;
            case int n when n > 0:
                Console.WriteLine("正の数の時にここに来る " + n);
                // ただし、上から順に判定するので、7 の時には来なくなる
                break;
            case int n:
                Console.WriteLine("整数の時にここに来る" + n);
                // 同上、0 以下の時にしか来ない
                break;
            default:
                Console.WriteLine("その他");
                break;
        }        
    }
    
}
"@

Add-Type -TypeDefinition $csharp
[CSharp7Sample]::DeconstructSample()
$hoge = [CSharp7Sample]::Tally([int[]](1..5))
"$($hoge.Item2)/$($hoge.item1)"
[CSharp7Sample]::ClassSwitch("hoge")