foreach($item in @(1,2,3,4)){
    $item * $item
}
@(1,2,3,4) | ForEach-Object {$_ * $_}