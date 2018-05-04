# PowerShell4.0までの列挙型はC#文字列の動的コンパイルだった
Add-Type @'
public enum Colors
{
  Red,
  Blue,
  Green,
}
'@

[Colors]::Red # Red が出力される