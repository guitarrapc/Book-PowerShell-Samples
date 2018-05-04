$toCsv = $customObject | ConvertTo-Csv
$toCsv
$fromCsv = $toCsv | ConvertFrom-Csv
$fromCsv