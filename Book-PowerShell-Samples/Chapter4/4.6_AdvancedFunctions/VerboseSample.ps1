function Get-StandardMessegeSample{
  [CmdletBinding()]
  param()
  
  "このメッセージは標準出力と同じです"
  Write-Output "a"
}

function Get-HostMessegeSample{
  [CmdletBinding()]
  param()
  
  Write-Host "このメッセージは画面にのみ出力されて、変数で受け取ることはできません。"
  Write-Output "a"
}

function Get-VerboseSample{
  [CmdletBinding()]
  param()
  
  Write-Verbose "このメッセージは-Verboseパラメーターを追加していると見えます。変数で受け取ることはできません。"
  Write-Output "a"
}

