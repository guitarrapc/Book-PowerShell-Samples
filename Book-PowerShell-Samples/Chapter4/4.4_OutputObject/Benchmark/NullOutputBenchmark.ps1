class Result {
    [string]$Name
    [double]$TotalMilliseconds
}

[Result]@{
    Name              = 'Normal'
    TotalMilliseconds = & {
        $result = Measure-Command {
            foreach ($i in 1..10000) {
                $i
            }
        }
        return $result.TotalMilliseconds
    }
}

[Result]@{
    Name              = 'OutNull'
    TotalMilliseconds = & {
        $result = Measure-Command {
            foreach ($i in 1..10000) {
                $i | Out-Null
            }
        }
        return $result.TotalMilliseconds
    }
}

[Result]@{
    Name              = '[void]'
    TotalMilliseconds = & {
        $result = Measure-Command {
            foreach ($i in 1..10000) {
                [void]$i
            }
        }
        return $result.TotalMilliseconds
    }
}

[Result]@{
    Name              = '> $null'
    TotalMilliseconds = & {
        $result = Measure-Command {
            foreach ($i in 1..10000) {
                $i > $null
            }
        }
        return $result.TotalMilliseconds
    }
}

[Result]@{
    Name              = '$null = '
    TotalMilliseconds = & {
        $result = Measure-Command {
            foreach ($i in 1..10000) {
                $null = $i
            }
        }
        return $result.TotalMilliseconds
    }
}
