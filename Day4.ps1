Get-Item
Get-ChildItem
Remove-Item
Get-ItemProperty
Get-ItemPropertyValue
New-Item

Get-Command -Verb * -Noun Item

New-Item -Path C:\Demo\ -Name Naber -ItemType Directory 
Remove-Item -Path C:\Demo\Naber

#HKLM
#HKCU

New-Item -Path HKLM:\SOFTWARE -Name Demo 
Remove-Item -Path HKLM:\SOFTWARE\Demo

New-ItemProperty -Path HKLM:\SOFTWARE\Demo -Name Yusuf -PropertyType string -Value "3"
Set-ItemProperty -Path HKLM:\SOFTWARE\Demo -Name Yusuf -Value "10"

Remove-ItemProperty -Path HKLM:\SOFTWARE\Demo -Name Yusuf
Rename-Item -Path HKLM:\SOFTWARE\Demo -NewName Demo1

Get-Acl -Path HKLM:\SOFTWARE\Demo1


#Bana HKLM altında SuperMario adında bir key klasör oluşturun.
New-Item -Path HKLM:\SOFTWARE\ -Name SuperMario
#Oluşturduğunuz bu klasör altında Gold adında bir string property olsun, değeride 100 olsun.
New-ItemProperty -Path HKLM:\SOFTWARE\SuperMario -Name Gold -PropertyType string -Value "100"
#Daha sonra bu propertynin değerini 200 olarak set edin.
Set-ItemProperty -Path HKLM:\SOFTWARE\SuperMario -Name Gold -Value "200"
#Daha sonra property ve klasörü silelim.
Remove-Item -Path HKLM:\SOFTWARE\SuperMario

#Get-ChildItem -Path HKLM:\SOFTWARE\* -Recurse 
#Get-Item -Path HKLM:\SOFTWARE\* 

#Get-Acl -Path HKLM:\SOFTWARE\ACLDemo | Set-Acl -Path HKLM:\SOFTWARE\SuperMario 


Get-ChildItem -Path C:\ -Recurse

#root\cimv2



Get-WmiObject -Namespace  root -List -Recurse | Select-Object -Unique __NAMESPACE #Namespace listelemek için kullanılır.
Get-WmiObject -Namespace root\Cimv2 -List | Where-Object {$PSItem.Name -like "*BIOS*"}

Get-WmiObject -Class Win32_BIOS -Namespace root\Cimv2 | Get-Member
Get-WmiObject -Class Win32_BIOS -Namespace root\Cimv2 | Format-List -Property *

#WS-MAN | winRM

#CIM Komutlarını kullanarak
Get-CimInstance -Namespace root -ClassName __NAMESPACE #Sorgu atmak için
Get-CimClass -ClassName *BIOS* -Namespace root\Cimv2 #Tabloları çağırmak için.
Get-CimInstance -ClassName Win32_BIOS -Namespace root\Cimv2

#LogicalDisk classına sorgu atın.
Get-CimClass -ClassName *LogicalDisk* -Namespace root\Cimv2
Get-CimInstance -ClassName win32_LogicalDisk | Select-Object DeviceID

#Service classını bulun ve sorgu atın.
Get-CimClass -ClassName "*service*"
Get-CimInstance -ClassName Win32_Service 
#Product classını bulun ve sorgu atın.
Get-CimClass -ClassName *Product* -Namespace root\Cimv2
Get-CimInstance -ClassName Win32_Product | Select-Object -Property Name 
#NetworkAdapter classını bulun ve sorgu atın.
Get-CimClass -ClassName *NetworkAdapter*
Get-CimInstance -ClassName Win32_NetworkAdapter
#Process classını bulun ve sorgu atın.
Get-CimClass -ClassName *process*
Get-CimInstance -ClassName win32_Process


#ComputerSystem Classını bulun ve sorgu atın ekranda sadece Name, Manufacturer, Model, BootupState, SystemType, 
#CurrentTimeZone, PCSystemType değerlerini görelim.
Get-CimClass -ClassName *ComputerSystem* -Namespace root\Cimv2 | Sort-Object -Property CimClassNAme
Get-CimInstance -ClassName CIM_ComputerSystem -Namespace root\Cimv2 | 
    Select-Object -Property Name, Manufacturer, Model, BootupState, SystemType, CurrentTimeZone, PCSystemType


#OperatingSystem classını bulun sorgu atın ve ekranda sadece SystemDevice,SystemDrive,OSArchitecture,LastBootUpTime değeri olsun.
Get-CimClass -ClassName *OperatingSystem* -Namespace root\Cimv2
Get-CimInstance -ClassName CIM_OperatingSystem -Namespace root\Cimv2 | 
    Select-Object -Property SystemDevice,SystemDrive,OSArchitecture,LastBootUpTime
#Makine üzerindeki paylaşımları getiren classı bulun ve sorgu atın.

Get-CimClass -ClassName *Share*

#Get-SmbShare

#HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanworkstation
#Get-Item -Path HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer | Get-ItemProperty

Get-CimInstance -ClassName Win32_Share -Namespace root\Cimv2
#Makine üzerinde startupcommandları saklayan classı bulun ve sorgu atın. Ekranda sadece Name, Location, User, Command olsun .

Get-CimClass -ClassName *Startup*
Get-CimInstance -ClassName Win32_StartupCommand | Select-Object -Property Name, Location, User, Command


Get-WmiObject -ComputerName LON-DC1 -Class Win32_StartupCommand  -Credential adatum\administrator | 
    Select-Object -Property Name, Location, User, Command

Get-CimInstance -ComputerName LON-DC1 -ClassName Win32_StartupCommand | 
    Select-Object -Property Name, Location, User, Command

$abdullahSession = New-CimSession -ComputerName LON-Dc1 -Credential adatum\administrator -Name LONDC1Session 
$Name = "Banu" 

Get-CimInstance -CimSession $abdullahSession -ClassName win32_BIOS
$abdullahSession | Remove-CimSession