[CmdletBinding()]
param(
	[Parameter(Mandatory = $true)]
    [PSCredential]$Credential
)
# なにか認証を使った処理
$Credential
