function Get-Process2{
  [CmdletBinding()]
  [OutputType([System.Diagnostics.Process[]])]
  param()
  Get-Process
}