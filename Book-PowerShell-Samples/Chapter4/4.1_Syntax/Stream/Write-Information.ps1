function WriteInformation{
    [CmdletBinding()]
    param()
    Write-Information "hoge"
}

WriteInformation -InformationAction Continue