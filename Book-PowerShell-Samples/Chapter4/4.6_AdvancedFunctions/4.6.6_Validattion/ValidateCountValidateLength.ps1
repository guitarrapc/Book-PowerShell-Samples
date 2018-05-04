function Get-DirectorySize {
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias("Path", "PSPath")]
        [ValidateCount(1, 2)]
        [ValidateLength(2, 6)]
        [string[]]$LiteralPath,
  
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [int]$OverSize
    )
}