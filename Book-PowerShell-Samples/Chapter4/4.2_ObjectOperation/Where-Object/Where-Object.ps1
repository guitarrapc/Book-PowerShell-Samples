1,9,3,7,5 | ForEach-Object {if($_ -le 5){$_}}
1,9,3,7,5 | Where-Object {$_ -le 5}