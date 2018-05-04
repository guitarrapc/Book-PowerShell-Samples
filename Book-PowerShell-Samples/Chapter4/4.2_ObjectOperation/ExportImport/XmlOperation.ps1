$toXml = $customObject | ConvertTo-Xml
$toXml
$toXml.Save("test.xml")
$xml = Get-Content -Path ./test.xml
$xml | Out-File ./test.xml -Encoding UTF8NoBom