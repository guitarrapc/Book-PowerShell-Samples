Invoke-WebRequest -Uri "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v7.6.1.0p1-Beta/OpenSSH-Win64.zip" -OutFile "OpenSSH-Win64.zip"
Expand-Archive -Path ./"OpenSSH-Win64.zip" -DestinationPath "$env:ProgramFiles"
Rename-Item -Path "$env:ProgramFiles\OpenSSH-Win64" -NewName OpenSSH
[Environment]::SetEnvironmentVariable('PATH', [Environment]::GetEnvironmentVariable('PATH') + ";$env:ProgramFiles\OpenSSH", 'Machine')

#sshdのインストール
. $env:ProgramFiles\OpenSSH\install-sshd.ps1
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic
ReStart-Service ssh-agent
ReStart-Service sshd