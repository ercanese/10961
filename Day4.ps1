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

#Uzak makineye cimsession ile bağlanarak makine üzerindeki BIOS bilgilerini getirin.
$SessionErcan = New-CimSession -ComputerName LON-DC1,LON-Svr1 -Credential adatum\administrator

Get-CimInstance -ClassName win32_BIOS -CimSession $SessionErcan

(Get-CimClass -ClassName win32_OperatingSystem).CimClassMethods


Get-CimInstance -ClassName win32_OperatingSystem -ComputerName LON-SVR1 |
    Invoke-CimMethod -MethodName Reboot 

(Get-CimClass -ClassName Win32_Service).CimClassMethods


Get-CimInstance -ComputerName LON-SVR1 -ClassName win32_service | Where-Object {$PSItem.Name -eq "ALG"} |
    Invoke-CimMethod -ComputerName LON-SVR1 -MethodName ChangeStartMode -Arguments @{StartMode="Automatic"}


#Değişkenler


$LogPath = "C:\Demo2"

#PascalCase
#camelCase

$LogPath.GetType()

$Number1 = 10

$Number1  | Get-Member
$Number1.GetType()

$Number2 = 20


$Name = "ercan"

$LastName = "Ese"


$ServiceALG = Get-Service -Name ALG
$ServiceALG.GetType()
$LaraUser = Get-ADUser -Identity LAra

(Get-Service -Name ALG).Name

$ServiceALG.Name

$Number1 + $Number2
$Name + " " + $LastName

#İki adet int değere sahip değişken oluşturun ve bunların toplamını toplan değişkeninde tutun.
$N1 = 100
$N2 = 200
$Toplam = $n1 + $n2

#Birtane log path değişkeni oluşturun C:\demo olsun bir adet File değişkeni oluşturun Demo.txt
#olsun bunların ikisini fullpath adında bir değişkende birleştirin.
$LogP = "C:\Demo"
$File = "Demo.txt"

$FullPath = $LogP + "\" + $File

Get-Item -Path $FullPath


#Ad üzerinde departmanı it olan tüm kullanıcıları bir değişkene atın.

$IT = Get-ADUser -Filter * -Properties Department,Name |
    Where-Object {$PSItem.Department -eq "IT"} | Select-Object -Property Name,Department
$IT = $null


Write-Host "$FullPath" -ForegroundColor Cyan

$BITS = Get-Service -Name BITS
Write-Host "$((Get-Service -Name BITS).Name)"
Write-Host "$($BITS.Name)" #Bir değişkenin propertysini çift tırnak içerisinde göstermek için kullanılır.
$BITS.name

$LogPath.GetType()
$LogPath | Get-Member

$LogPath.EndsWith("2")
$Email = "ercan.ese@bilgeadam.com"

$Email.Split("@")
$Email.Insert(2,"r")
$Email.Replace("bilgeadam.com","ercanese.com")

$DayNow = Get-Date
$DayNow.GetType()
$DayNow.ToShortDateString()
$DayNow.AddDays(-10)

#C:\demo\demo.txt içeren bir değişken oluşturun ve "\" işaretinden bölelim.
[string]$LogPath = "C:\demo\demo.txt"
$LogPath | Get-Member

$LogPath.Split("\")

#ercan.ese@bilgeadam.com içeren bir mail değişkeni oluşturun ve .com kısmını .com.tr olarak
#replace edin.

$Mail = "ercan.ese@bilgeadam.com"
$Mail.Replace(".com",".com.tr")
#yukarıda oluşturduğunuz C:\demo\demo.txt içeren değişkenin içeriğinin sonunda .txt varmı
#kontrol eden methodu kullanın.

$LogPath.EndsWith(".txt")
$LogPath.Split(".") | Select-Object -Last 1 

$LogPath.Split(".") | Select-Object -First 1

$LogPath.Split(".")[1]
$LogPath.Split(".")[-1] #-1 her zaman dizinin sonuncu elemanını getirir.
$LogPath.Split(".")[0..10]
#Bügünün tarihinden 50 gün öncesine giden bir değişken oluşturun.
#ekranda sadece kısa zamanı gösteren bir değişken oluşturun.

$Today = Get-Date 
$Today.AddDays(-50)
$Today.ToShortTimeString()
#Oluşturduğunuz herhangi bir değişkenin içerisini boşaltın.
$Today = $null


$users = "Ercan","Banu","Abdullah","yusuf","akın","begum"
$servisler = Get-Service
$servisler.GetType()

$users = $users + "Akif"
$users += "Fırat"

$users[1]
$users | Select-Object -First 1 -Skip 1
$users.GetType()

$bosdizi = @()
$bosdizi += "Ercan"
$bosdizi.GetType()

[array]$dizi = "Ercan"

$dizi += 1
#op_Add

[array]$dizi = "Ercan"

$dizi += 1
#op_Add

$LogPath.Split(".")[-1] 

#Boş elamanlı bir dizi oluşturun ve içerisine teker teker elma,armut ve çilek ekleyin.
$Meyveler = @()

$Meyveler += "Elma"
$Meyveler += "Armut"
$Meyveler += "çilek"

#Sadece çalışan servislerin olduğu bir dizi oluşturun.
$RunningS = Get-Service | Where-Object {$PSItem.Status -eq "Running"}
#Ad üzerinde Sales departmanına üye olan kullanııcları bir dizide tutun ve 10. kullanıcının
#ismini ekranda yalın halde gösterin.

$SalesUsers = Get-ADUser -Filter * -Properties Department | Where-Object {$PSItem.Department -eq "Sales"}
($SalesUsers | Select-Object -First 1 -Skip 9).name
$SalesUsers[9].Name