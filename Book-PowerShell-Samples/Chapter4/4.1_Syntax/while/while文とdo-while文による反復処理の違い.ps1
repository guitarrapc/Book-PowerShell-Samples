$val = 4
while($val -le 3){
    $val++
    Write-Host "while $val"
}
do{
    $val++
    Write-Host "do-while $val"
} while($val -le 3)