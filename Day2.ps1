Get-Service -ComputerName -Name AJRouter 

Get-Help -Name Get-Service -Full

Get-Help -Name GEt-eventlog -Full

Get-Help -Name Invoke-Sqlcmd -Full

Get-Module -Name SqlServer

Update-Help
Save-Help -DestinationPath C:\Modules

Update-Help -SourcePath C:\Modules

Invoke-Sqlcmd -ServerInstance UZAKMAKINE -Database USER -Username sa -Password 123 -Query "Select * from Yusuf"

Get-Help -Name Invoke-Sqlcmd -Full


#-------------------------------------------

#AD üzerinde bir adet HelpDesk adında bir grup oluşturalım.
Get-Command -Verb * -Noun *Group*
Get-Command -Verb * -Noun ADGroup

Get-Help -Name New-ADGroup -Full

New-ADGroup -DisplayName "Helpdesk" -Description "IT Grubudur" -GroupCategory Security -GroupScope Global -Name Helpdesk 
Get-ADGroup -Identity HElpdesk


#AD üzerinde herkes kendi ismiyle bir kullanıcı oluştursun.

Get-Command -Verb New -Noun "*User*"
New-ADUser -Name "ErcanEse" -SamAccountName "ercan.ese" -Department "IT"
Get-ADUser -Identity ercan.ese

#Oluşturdugunuz kullanıcıyı helpdesk grubuna ekleyelim.
Get-Command -Verb * -Noun "ADGroup*"

Add-ADGroupMember -Identity helpdesk -Members ercan.ese



#Olusturgumuz kullanıcının Departman bilgisini ITM olarak set edelim.
Get-Command -Verb * -Noun ADUser
Set-ADUser -Identity ercan.ese -Department ITM
Get-ADUser -Identity ercan.ese -Properties *

#Grubunun üyelerini çekelim powershell ile.
Get-ADGroupMember -Identity helpdesk



#ITM adında bir security grup oluşturun.
New-ADGroup -DisplayName "ITM" -Description "It Grubudur" -GroupCategory Security -GroupScope Global -Name ITM 
Get-ADGroup -Identity ITM
#Kendi adınızda bir kullanıcı oluşturun, Departmanı Sales olsun.
New-ADUser -Name "Banu" -Department "Sales" -SamAccountName banu.denk 
Get-ADUser -Identity banu.denk

#oluşturdugunuz bu gruba Ida ve kendi kullanıcınızı ekleyin.
Add-ADGroupMember -Identity ITM -Members "banu.denk",ida
Get-ADGroupMember -Identity ITM


#Sonra ida kullanıcısını bu gruptan çıkarın.
Remove-ADGroupMember -Identity ITM -Members Ida -Confirm:$false

#Kendi kullanıcınızın Description alanını "ISTANBUL" olarak set edin.

Set-ADUser -Identity banu.denk -Description "ISTANBUL"

get-aduser -Identity banu.denk -Properties *
get-aduser -Identity banu.denk -Properties Description,Department,TrustedForDelegation


Get-Command -Verb * -Noun "*Address*"
Get-Command -Verb * -Noun NetIPAddress

Get-NetIPAddress

New-NetIPAddress -InterfaceIndex 3 -IPAddress 172.16.0.100 -PrefixLength 16 #-DefaultGateway 172.16.0.1 
Test-NetConnection -ComputerName 172.16.0.100

Test-NetConnection -ComputerName 172.16.0.100 -Port 80
Test-Connection

Remove-NetIPAddress -IPAddress 172.16.0.11 -InterfaceIndex 3 -Confirm:$false


#Yeni bir ip olarak 172.16.0.200 ipsini prefix 16 olacak sekilde makineye tanımlayın.
Get-NetIPAddress -AddressFamily IPv4
New-NetIPAddress -InterfaceIndex 3 -IPAddress 172.16.0.200 -PrefixLength 16
Remove-NetIPAddress -IPAddress 172.16.0.200 -InterfaceIndex 3
#test cmdletleriyle makinedeki yeniipyi teste edin.
Test-Connection -ComputerName 172.16.0.200
#Eski ip adresini makineden kaldırın.
Remove-NetIPAddress -IPAddress 172.16.0.100 -InterfaceAlias "Ethernet"


#Pipeline


# | = Pipeline

#altgr + -

Get-Service -Name BITS 
Stop-Service -Name BITS

Get-Service -Name BITS | start-Service

Get-ADUser -Identity banu.denk | Set-ADUser -GivenName Banu
Get-ADUser -Identity banu.denk

#Notepad processini başlatın ve pipeline kullanarak bu notepadi kapatın.
Get-Process -Name notepad
Stop-Process -Name notepad

Get-Process -Name notepad | Stop-Process 


#ALG Servisinin StartType değerini manual olarak set edelim fakat pipeline kullanarak.
Get-Service -Name ALG
Set-Service -Name ALG -StartupType Manual
Get-Service -Name ALG | Set-Service -StartupType Manual

Get-Service -Name ALG,BITS
Get-Process -Name powershell_ise,notepad


Get-NetIPAddress


Get-EventLog -LogName Application


Get-Service -Name ALG,BITS

Get-Service -Name ALG | Get-Member
Get-Process -Name notepad | Get-Member


Get-ADUser -Identity banu.denk -Properties * | Get-Member -Name Bad*


#Bir processin başlangıc tarihini gösteren bir property varmı bulalalım.
#Bir servisin bağımlılıklarını ekranda gösteren bir property varmı bulalım.
#bir aduser kullanıcısının ne zaman logon olduğu ile ilgili bir property varmı kontrol edelim.
#bir ad grubun ne zaman olusturuldugu ile ilgili bir bilgi varmı kontrol edelim.
#Bugünün tarihini getiren cmdletin sadece yılı getiren bir özelliği propertysi varmı kontrol edelim.
#Bir processin başlangıc tarihini gösteren bir property varmı bulalalım.
Get-Process -Name ChsIME | Get-Member
StartTime
#Bir servisin bağımlılıklarını ekranda gösteren bir property varmı bulalım.
Get-Service -Name ALG | Get-Member
DependentServices
#bir aduser kullanıcısının ne zaman logon olduğu ile ilgili bir property varmı kontrol edelim.

Get-ADUser -Identity banu.denk -Properties * | Get-Member
LastLogonDate

#bir ad grubun ne zaman olusturuldugu ile ilgili bir bilgi varmı kontrol edelim.
Get-ADGroup -Identity IT -Properties * | Get-Member
created
whenCreated
#Bugünün tarihini getiren cmdletin sadece yılı getiren bir özelliği propertysi varmı kontrol edelim.
Get-Date | Get-Member
Year


Format-Table #TAblo şeklinde gösterir
Format-List #Liste şeklinde gösterir
Format-Wide #Kolon halinde gösterir


Get-Date | Format-Table -Property Day,Month,Year
Get-Date | Format-List -Property Day,Month,year


Get-ADUser -Identity Ida -Properties * | 
    Format-Table -Property Name,Department,City 

Get-ADUser `
-Identity Ida -Properties *


Get-ADUser -Identity Ida -Properties * | 
Format-List -Property Name,Department,City

Get-ADUser -Identity Lara -Properties * | Get-Member -Name *Logon*
Get-ADUser -Identity Lara -Properties * | Format-List -Property *Logon*

#Yukarıda bulduğumuz propertyleri ekranda yan propertylerde olacak sekilde tablo ve liste halinde
# gösterin.
Get-Process | Format-Table -Property Name,StartTime
Get-Process | Format-List -Property Name,StartTime

Get-ADUser -Identity Administrator -Properties LastLogonDate | 
    Format-Table -Property Name,LastLogonDate


Get-ADUser -Identity Administrator -Properties LastLogonDate | 
    Format-List -Property Name,LastLogonDate

Get-ADUser -Identity Lara -Properties * | Format-Table -Property Name,Created,WhenCreated
Get-ADUser -Identity Lara -Properties * | Format-List -Property Name,Created,WhenCreated
Get-Service | Format-Table -Property Name,Status,StartType,DisplayName -AutoSize -Wrap


#Sıralama için kullandığımız Sort-object

Get-Service | Sort-Object -Property Name
Get-Service | Sort-Object -Property Status

Get-Service | Sort-Object -Property Name -Descending | Format-Table -Property Name,Status,StartType
Get-Service | Sort-Object -Property Status -Descending

Get-Help -Name Get-ADUser -Full

Get-ADUser -Identity Lara
Get-ADUser -Filter * -Properties * #Tüm kullanıcıların tüm propertyleri

#Bana processleri cpu değerine göre sıralayın ve ekranda sadece isim cpu ve starttime değeri olsun.
Get-Process | 
    Sort-Object -Property CPU | Format-Table -Property Name,StartTime,CPU

#Bana servisleri statuse göre tersten sıralayın ve sadece ekranda name,Status,starttype olsun.
Get-Service |
    Sort-Object -Descending -Property Status |
        Format-Table -Property Name,Status,StartType


#bana ad üzerinde kullanıcıları departmana göre sıralayarak ekranda sadece name,samaccountname ve department 
#olacak sekilde getirin.
Get-ADUser -Filter * -Properties Department |
    Sort-Object -Property Department |
        Format-Table -Property Name,SamAccountName,Department



#Bana en çok cpu tüketen processler en üstte olacak şekilde bir sıralama yapın
#ve ekranda sadece name cpu değeri olsun.

Get-Process |
    Sort-Object -Property CPU -Descending |
        Format-Table -Property Name,CPU


        