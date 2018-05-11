function Get-DirectorySize {
    [CmdletBinding()]
    param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [string[]]$LiteralPath,
      [parameter(ValueFromPipelineByPropertyName = $true)]
      [int]$OverSize
    )
    process {
      foreach ($path in $LiteralPath) {
        $measure = Get-ChildItem -LiteralPath $path -Recurse -Force -File | Measure-Object -Sum Length
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