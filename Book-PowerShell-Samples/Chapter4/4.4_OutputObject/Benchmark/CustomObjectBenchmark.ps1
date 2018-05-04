$source = @"
public class MyClass
{
    public string Date { get; set; }    
    public string Path { get; set; }
    public int FileCount { get; set; }
    public int Sum { get; set; }
}
"@
Add-Type -TypeDefinition $source -Language CSharp

class MyClass2 {
    [string]$Date
    [string]$Path
    [int]$FileCount
    [int]$Sum
}

class Result {
    [string]$Name
    [double]$TotalSecond
}

[Result]@{
    Name        = "AddMember_Pipeline"
    TotalSecond = & {
        $result = Measure-Command {
            foreach ($i in 1..10000) {
                $output = New-Object -TypeName PSObject
                $output | Add-Member -MemberType NoteProperty -Name Name -Value "Joh" -PassThru |
                    Add-Member -MemberType NoteProperty -Name Number -Value 1 -PassThru |
                    Add-Member -MemberType NoteProperty -Name ID -Value 10 -PassThru
            }
        }
        return $result.TotalSeconds
    }
}

[Result]@{
    Name        = "AddMember"
    TotalSecond = & {
        $result = Measure-Command {
            foreach ($i in 1..10000) {
                $output = New-Object -TypeName PSObject
                $output | Add-Member -MemberType NoteProperty -Name Name -Value "Joh" -PassThru
                $output | Add-Member -MemberType NoteProperty -Name Number -Value 1 -PassThru
                $output | Add-Member -MemberType NoteProperty -Name ID -Value 10 -PassThru
            }
        }
        return $result.TotalSeconds
    }
}

[Result]@{
    Name        = "CSharpClass"
    TotalSecond = & {$result = Measure-Command {
            foreach ($i in 1..10000) {
                $property = @{
                    Date      = $date
                    Path      = $LiteralPath
                    FileCount = $measure.Count
                    Sum       = $measure.Sum
                }
                $output = New-Object -TypeName MyClass -Property $property
            }
        }
        return $result.TotalSeconds
    }
}

[Result]@{
    Name        = "CSharpClass_Declare"
    TotalSecond = & {$result = Measure-Command {
            foreach ($i in 1..10000) {
                $output = [MyClass]@{
                    Date      = $date
                    Path      = $LiteralPath
                    FileCount = $measure.Count
                    Sum       = $measure.Sum
                }
            }
        }
        return $result.TotalSeconds
    }
}

[Result]@{
    Name        = "PowerShellClass"
    TotalSecond = & {$result = Measure-Command {
            foreach ($i in 1..10000) {
                $output = [MyClass2]@{
                    Date      = $date
                    Path      = $LiteralPath
                    FileCount = $measure.Count
                    Sum       = $measure.Sum
                }
            }
        }
        return $result.TotalSeconds
    }
}

[Result]@{
    Name        = "PSObject"
    TotalSecond = & {$result = Measure-Command {
            foreach ($i in 1..10000) {
                $output = @{
                    Date      = $date
                    Path      = $LiteralPath
                    FileCount = $measure.Count
                    Sum       = $measure.Sum
                }
                $output = New-Object -TypeName PSObject -Property $property
            }
        }
        return $result.TotalSeconds
    }
}

[Result]@{
    Name        = "PSCustomObject"
    TotalSecond = & {$result = Measure-Command {
            foreach ($i in 1..10000) {
                $output = [pscustomobject]@{
                    Date      = $date
                    Path      = $LiteralPath
                    FileCount = $measure.Count
                    Sum       = $measure.Sum
                }
            }
        }
        return $result.TotalSeconds
    }
}

[Result]@{
    Name        = "SelectObject"
    TotalSecond = & {$result = Measure-Command {
            foreach ($i in 1..10000) {
                $output = 1 | Select-Object Date, Path, FileCount, Sum
                $output.Date = $date
                $output.Path = $LiteralPath
                $output.FileCount = $measure.Count
                $output.Sum = $measure.Sum
            }
        }
        return $result.TotalSeconds
    }
}