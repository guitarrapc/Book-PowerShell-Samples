function Get-DirectorySize {
    [CmdletBinding()]
    param(
      [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
      [Alias("Path", "PSPath")]
      [ValidateNotNullOrEmpty()]
      [string[]]$LiteralPath,
  
      [parameter(ValueFromPipelineByPropertyName = $true)]
      [int]$OverSize
    )
  }