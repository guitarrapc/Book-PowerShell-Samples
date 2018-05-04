$toJson = $customObject | ConvertTo-Json
$toJson
$fromJson = $toJson | ConvertFrom-Json
$fromJson