$toHtml = $customObject | ConvertTo-Html
$toHtml | Out-File test.html
chrome ./test.html