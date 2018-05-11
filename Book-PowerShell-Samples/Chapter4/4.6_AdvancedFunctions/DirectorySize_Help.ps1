function Get-DirectorySize {
  <#
  .SYNOPSIS
  コマンドの概要
  .DESCRIPTION
  コマンドの詳細
  .EXAMPLE
  実行例
  .EXAMPLE
  ./ | Get-DirectorySize -OverSize 1000
  .PARAMETER LiteralPathか
  パラメーターの名前や解説
  .PARAMETER OverSize
  ディレクトリのサイズを指定して出力時に大きったか判定します
  .LINK
  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-6
  #>
  
  [CmdletBinding()]
  param(
    [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$LiteralPath,

    [parameter(ValueFromPipelineByPropertyName = $true)]
    [int]$OverSize,

    [parameter(ValueFromPipelineByPropertyName = $true)]
    [int]$MinSize
  )
  process {
    foreach ($path in $LiteralPath) {
      $measure = Get-ChildItem -LiteralPath $path -Recurse -Force -File | Measure-Object -Sum Length
      $output = [pscustomobject]@{
        Path      = $path
        FileCount = $measure.Count
        Sum       = $measure.Sum
        OverSize  = $measure.Sum -ge $OverSize
        MinSize   = $measure.Sum -le $MinSize
      }
      Write-Output $output
    }
  }
}