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