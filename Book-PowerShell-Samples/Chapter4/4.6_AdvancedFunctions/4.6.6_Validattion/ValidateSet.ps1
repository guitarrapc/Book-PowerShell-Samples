function Get-DirectorySize {
    [CmdletBinding()]
    param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias("Path", "PSPath")]
      [ValidateSet("Test","Hoge")]
      [string[]]$LiteralPath,
      
      [parameter(ValueFromPipelineByPropertyName = $true)]
      [int]$OverSize
    )
}