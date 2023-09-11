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

 

#Wildcard karakter kullanımı. Aile başlayan servisler.
Get-Service -Name A*
Get-Service -Name *t
Get-Service -Name *a*


Get-Command -Verb Get -Noun *User*
Get-Command -Verb Set -Noun *User*

Get-Command -Verb Get -Noun *User*
Get-Command -Verb * -Noun LocalUser

Get-LocalUser -Name Administrator
New-LocalUser -Name ErcanEse -AccountNeverExpires -FullName "Ercan ESE" -NoPassword
Get-LocalUser -Name ErcanEse

#Makine üzerinde bulunan komutlar içerisinden bir "user" oluşturma görevi olan komutu bulun ve Pembe adında bir kullanıcı oluşturun.
#Oluşturduğunuz bu kullanıcının ismini değiştiren "rename" eden komutu bulun ve ismini mavi olarak değiştirin.
Get-Command -Verb * -Noun LocalUser
New-LocalUser -Name Pembe -AccountNeverExpires -FullName "-Pembe" -NoPassword 
Rename-LocalUser -Name Pembe -NewName Mavi
Set-LocalUser -Name Mavi -FullName "Mavi" 
#Makine üzerindeki "Firewall" kurallarını listeleyen komutu bulun ve çalıştırın.
Get-Command -Verb Get -Noun "*Firewall*"
Get-NetFirewallRule 
#Makine üzerinde Network "adapter"'ları listeleyen komutu bulun ve çalıştırın.
Get-Command -Verb Get -Noun "*adapter*"
Get-NetAdapter
#"DNS" ismini resolve eden bir komut var onu bulun ve ercanese.com adresini resolve edin.
Get-Command -Verb * -Noun "*DNS*"
Resolve-DnsName -Name ercanese.com #-Server 10.10.0.10
#Makine üzerinde ip "address" lerini listeleyen komutu bulun ve ipleri getirin.
Get-Command -Verb Get -Noun "*Address*" 
Get-NetIPAddress
#SQL Server içerisinde olan tüm komutlarını ekranda listeleyelim.
Get-Command -Module SqlServer -Verb Get -Noun "*Job*"
#Makinenin "tarihini (date)" getiren komutu bulun ve çalıştırın.
Get-Command -Verb * -Noun *date*

get-date


####Help

Get-Help -Name Get-service

Get-Service -ComputerName -Name AJRouter 

Get-Help -Name Get-Service -Full