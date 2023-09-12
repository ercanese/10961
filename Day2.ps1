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
