#バックアップ
$config = "$env:ProgramData\ssh\sshd_config"
$backup = "$config" + "_org"
Copy-Item -Path $config -Destination $backup

#Config書き換え
$version = "6.0.2"
$keyAuth = "PubkeyAuthentication yes"
$passwordAuth = "PasswordAuthentication yes"
$existingSubsystem = "Subsystem`tsftp`tsftp-server.exe"
$newSubsystem = $existingSubsystem + "`r`nSubsystem`tpowershell`tc:/program files/powershell/$version/pwsh.exe -sshs -NoLogo -NoProfile"
Get-Content $backup | 
ForEach-Object {$_ -replace "#$keyAuth",$keyAuth} |
ForEach-Object {$_ -replace "#$passwordAuth", $passwordAuth} | 
ForEach-Object {$_ -replace $existingSubsystem,$newSubsystem} |
Out-File -LiteralPath $config
Restart-Service sshd