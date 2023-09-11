Install-Module -Name SqlServer
Get-Module -Name SqlServer -ListAvailable
Get-Module -ListAvailable

Get-Module -Name SQLServer -ListAvailable

Add-RoleMember

Get-Module
Invoke-Sqlcmd 
Import-Module -Name SQLServer


Get-Process -Id 6548
Get-Process -Name alg

Get-EventLog -LogName Application

Set-Service -Name BITS -Description Naber
Set-Service
<#
Get-Service -Name "ALG","BITS" 
Get-Service -na



Get-Service -DisplayName "Apple Mobile Device Service"
#>
#Tüm Servisleri listeleyelim.
Get-Service
#Servisler içerisinden sadece ALG servisini listeleyelim.
Get-Service -Name ALG
#ALG Servisini durdurun.
Start-Service -Name ALG
Stop-Service -Name ALG
Set-Service -Name ALG -Status Stopped
#Durmus olan alg servisinin starttype değerini disabled olarak set edin.
Set-Service -Name ALG -StartupType Disabled
Set-Service -Name ALG -StartupType Automatic
#Notepad processini durdurun.
Get-Process -Name notepad
Stop-Process -Name notepad
Start-Process -FilePath C:\Windows\notepad.exe #-ArgumentList "n=ercan"
Start-Process notepad

Get-Service -Name ALG
#pszabbix modülünü makineye yükleyin.
Install-Module -Name pszabbix
#Yüklü olduğunu teyit edin.
Get-Module -Name PSZabbix -ListAvailable 