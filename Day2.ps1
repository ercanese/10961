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