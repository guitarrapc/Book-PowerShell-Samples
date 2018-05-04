function Get-SampleText{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0, ValueFromPipeline = $true)]
        [string]$Text = "Sample"
    )

    process{
        Write-Output -InputObject $Text
    }
}