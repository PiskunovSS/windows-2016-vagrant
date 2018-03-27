$password = ConvertTo-SecureString "vagrant" -AsPlainText -Force
$cred= New-Object System.Management.Automation.PSCredential ("vagrant", $password)
$s = New-PSSession 127.0.0.1  -Credential $cred -Port 55985
If ($? -ne "True") { Exit 1}
# Получаем результат работы provision через WinRM
$sb = { get-content C:\Windows\System32\file_test.txt }
Invoke-Command -Session $s -ScriptBlock $sb
If ($? -ne "True") { Write-Output 'WinRM and provision check error'; Exit 1}
Get-PSSession | Remove-PSSession
Write-Output 'WinRM and provision check OK'