function Get-DirectorySize {
    [CmdletBinding()]
    param(
      [parameter(Mandatory=$true)]
      [string]$LiteralPath,
      [int]$OverSize
    )
    process {
      $measure = Get-ChildItem -LiteralPath $LiteralPath -Recurse -Force -File | Measure-Object -Sum Length
      $output = [pscustomobject]@{
        Path      = $LiteralPath
        FileCount = $measure.Count
        Sum       = $measure.Sum
        OverSize  = $measure.Sum -ge $OverSize
      }
      Write-Output $output
    }
  }