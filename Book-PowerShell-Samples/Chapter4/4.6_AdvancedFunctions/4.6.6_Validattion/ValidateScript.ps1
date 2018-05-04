function Get-DirectorySize {
    [CmdletBinding()]
    param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias("Path", "PSPath")]
      [ValidateScript({$_ -match "hoge"})]
      [string[]]$LiteralPath,
      
      [parameter(ValueFromPipelineByPropertyName = $true)]
      [int]$OverSize
    )
}