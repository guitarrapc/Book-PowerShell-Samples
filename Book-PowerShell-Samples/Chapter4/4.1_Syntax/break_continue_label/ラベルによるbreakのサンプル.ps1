$red = $yellow = $other = $true
:red while ($red) {
    $red = $false
    :yellow while ($yellow) {
    while ($other) {
      if ($red) {break red}
      if ($yellow) {$yellow = $false;break yellow}
      break
    }
    Write-Host "After innermost loop"
  }
  Write-Host "After yellow loop"
}
Write-Host "After red loop"