$val = 4
do{
    $val++
    Write-Host "do-until $val"
} until($val -ge 3)