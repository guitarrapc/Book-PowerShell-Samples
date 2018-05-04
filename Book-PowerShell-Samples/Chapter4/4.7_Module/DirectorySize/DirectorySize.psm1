$logfie = "./error.log"
$counter = 0

function Write-Hoge{
  Write-host "hoge"
}

function Get-MyDirectorySize {
  [CmdletBinding()]
  param(
    [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
    [ValidateNotNullOrEmpty()]
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

New-Alias -Name gmds -Value Get-DirectorySize

Export-ModuleMember -Function Write-Hoge,Get-MyDirectorySize
Export-ModuleMember -Variable logfile
Export-ModuleMember -Alias gds