using namespace System.IO
using namespace System.Text

function Use([IDisposable]$Disposable, [ScriptBlock]$ScriptBlock) {
    try {
        . $ScriptBlock($Disposable)
    }
    finally {
        if ($null -ne $Disposable) {
            $Disposable.Dispose()
        }
    }
}

$path = Join-Path $pwd foo.txt
Use (New-Object FileStream($path, ([FileMode]::Create -band [FileMode]::Open))) -ScriptBlock {
    param($writer)
    $bytes = [Encoding]::UTF8.GetBytes("foo")
    $writer.Write($bytes, 0, $bytes.Length)
}