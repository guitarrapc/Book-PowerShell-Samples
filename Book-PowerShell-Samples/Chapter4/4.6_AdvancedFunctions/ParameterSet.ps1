function Test-ParametrSet{
  [CmdletBinding(DefaultParameterSetName="foo")]
  param(
    [parameter(ParameterSetName="foo")]
    [string]$Foo,
    [parameter(ParameterSetName="foo")]
    [int]$Fooint,

    [parameter(ParameterSetName="bar")]
    [string]$Bar,
    [parameter(ParameterSetName="foo")]
    [parameter(ParameterSetName="bar")]
    [int]$BarInt
  )
}