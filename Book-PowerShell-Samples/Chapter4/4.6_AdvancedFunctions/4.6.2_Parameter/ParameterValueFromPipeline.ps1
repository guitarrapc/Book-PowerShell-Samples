function Get-DirectorySize {
    [CmdletBinding()]
    param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true)]
      [string[]]$LiteralPath,
      [string]$OverSize
    )
    process {
      foreach ($path in $LiteralPath) {
        $measure = Get-ChildItem -LiteralPath $Path -Recurse -Force -File | Measure-Object -Sum Length
        $output = [pscustomobject]@{
          Path      = $path
          FileCount = $measure.Count
          Sum       = $measure.Sum
          OverSize  = $measure.Sum -ge $OverSize
        }
        Write-Output $output
      }
    }
  }