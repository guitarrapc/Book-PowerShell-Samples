$customObject | Export-CliXml -Path test2.xml
Get-Content -Path ./test2.xml
Import-CliXml -Path ./test2.xml