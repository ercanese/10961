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


#Makine üzerindeki "Firewall" kurallarını listeleyen komutu bulun ve çalıştırın.

#Makine üzerinde Network "adapter"'ları listeleyen komutu bulun ve çalıştırın.

#"DNS" ismini resolve eden bir komut var onu bulun ve ercanese.com adresini resolve edin.


#Makine üzerinde ip "address" lerini listeleyen komutu bulun ve ipleri getirin.

#SQL Server içerisinde olan tüm komutlarını ekranda listeleyelim.


#Makinenin "tarihini (date)" getiren komutu bulun ve çalıştırın.
Get-Command -Verb Get -Noun *date*

get-date
