function Get-DirectorySize {
  [CmdletBinding()]
  param(
    [parameter(Position=1)]
    [string]$LiteralPath,
	[parameter(Position=0)]
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