Get-ExecutionPolicy 
Set-ExecutionPolicy -ExecutionPolicy Restricted
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

powershell.exe -ExecutionPolicy ByPass -File C:\Users\Administrator.ADATUM\Desktop\Hello.ps1

#HelloWorld adında bir ps1 oluşturun ekrana hello world yazsın.
#Scripti çalıştırın
#Executionpolicy restricted duruma alarak çalıltırın.
#ByPass edin
#Executionpolicy unrestricted duruma çekin.

$cert = Get-ChildItem -Path Cert:\CurrentUser\My -CodeSigningCert
Set-AuthenticodeSignature -Certificate $cert -FilePath C:\Hello.ps1



$Users = "Caner","Ercan","Yusuf","Begüm","Abdullah","Ahmet"

$Mail = "@bilgeadam.com"


foreach($k in $Users)
{
  $FullMail = $k + $Mail
  Write-Host "$FullMail" -ForegroundColor Yellow
}

#Lara,Ida,Parsa kullanıcılarını bir dizi içerisinde tutun ve departman alanını Sales olarak set edin.
$UsersAD     = "Lara","Ida","Parsa"
$Departmenet = "Sales"

#Set-ADUser -Identity LAra -Department Sales

foreach($y in $UsersAD)
{
    Set-ADUser -Identity $y -Department $Departmenet
    Get-ADUser -Identity $y -Properties Department | Select-Object -Property Name,Department
}

#IT,Sales gruplarının isimlerini ekranda kırmızı gösteren kodu yazın.

$Group = "IT","Sales"
foreach($color in $Group)
{
    Write-Host "$color" -ForegroundColor Red
}


#BITS,ALG ve WwanSvc serviserinin durumunu ekranda kırmızı bir şekilde gösteren kodu yazın.

$Services = "BITS","ALG","WwanSvc"

foreach($item in $Services)
{
    $Service = Get-Service -Name $item | Select-Object -Property Status
    Write-Host  "$item : $($Service.Status)" -ForegroundColor Red
}

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\.NETFramework

Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\.NETFramework" | Get-Member
$Paths = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\.NETFramework" -Recurse | Select-Object -property PSPath

$Prop = "Demo"

foreach ($item in $Paths)
{
    Get-ItemProperty -Path $item.pspath -Name $Prop -ErrorAction SilentlyContinue
}

Get-Service -Verbose


$Size = 10GB

if($Size -le 5GB)
{
    Write-Host "Girilen Size 5GBdan küçük : $($Size/1GB)" 
}
else
{
    Write-Host "Girilen Size 5GBdan büyük : $($Size/1GB)" 
 
}


$AllUsers = Get-ADUser -Filter * -Properties Department

foreach ($item in $AllUsers)
{
    if($item.Department -eq "Sales")
    {
        Write-Host "$($item.Name) adlı kullanıcının departmanı Sales'tır" -ForegroundColor Green
    }
    else
    {
        Write-Host "$($item.Name) adlı kullanıcının departmanı sales değildir"
    }
}

#Tüm servisleri bir dizide tutun ve çalışan servisleri yeşil olarak isimşerini ekranda görelim.
#Çalışmayan servisleri ise kırmızı olarak ekranda görelim.

$Servisler = Get-Service

foreach ($item in $Servisler)
{
    if($item.Status -eq "Stopped"){
        Write-Host "$($item.Name) adlı servis durmuş." -ForegroundColor Red
    }
    else
    {
        Write-Host "$($item.Name) adlı servis çalışıyor." -ForegroundColor Green
        
    }
}



$Servisler = Get-Service

foreach ($item in $Servisler)
{
    if($item.Status -eq "Stopped"){
        Write-Host "$($item.Name) adlı servis durmuş." -ForegroundColor Red
    }
    else
    {
        Write-Host "$($item.Name) adlı servis çalışıyor." -ForegroundColor Green
        
    }
}

#Bana cpu deperi 10dan büyük olan processleri ekranda isimleri kırmızı olarak yazın.
#cpu değeri 10dan düşükse onlarıda yeşil olarak görelim.

$Proccesses = Get-Process 

foreach ($item in $Proccesses)
{
   if($item.CPU -gt 10)
   {
        Write-Host "$($item.Name) adlı process cpu değeri 10 dan büyük. Anlık : $($item.CPU) $($item.StartTime)" -ForegroundColor Red
   }
   else
   {
        Write-Host "$($item.Name) adlı process cpu değeri 10 dan küçük. Anlık : $($item.CPU)" -ForegroundColor Green
   }
}



$Users = "Caner","Ercan","Yusuf","Begüm","Abdullah","Ahmet"

$Users -join "-"

$Mail = "@bilgeadam.com"


foreach($k in $Users)
{
  $FullMail = $k + $Mail
  Write-Host "$FullMail" -ForegroundColor Yellow
}

#Lara,Ida,Parsa kullanıcılarını bir dizi içerisinde tutun ve departman alanını Sales olarak set edin.
$UsersAD     = "Lara","Ida","Parsa"
$Departmenet = "Sales"

#Set-ADUser -Identity LAra -Department Sales

foreach($y in $UsersAD)
{
    Set-ADUser -Identity $y -Department $Departmenet
    Get-ADUser -Identity $y -Properties Department | Select-Object -Property Name,Department
}

#IT,Sales gruplarının isimlerini ekranda kırmızı gösteren kodu yazın.

$Group = "IT","Sales"
foreach($color in $Group)
{
    Write-Host "$color" -ForegroundColor Red
}


#BITS,ALG ve WwanSvc serviserinin durumunu ekranda kırmızı bir şekilde gösteren kodu yazın.

$Services = "BITS","ALG","WwanSvc"

foreach($item in $Services)
{
    $Service = Get-Service -Name $item | Select-Object -Property Status
    Write-Host  "$item : $($Service.Status)" -ForegroundColor Red
}



Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\.NETFramework" | Get-Member
$Paths = Get-ChildItem -Path "HKLM:\SOFTWARE\Microsoft\.NETFramework" -Recurse | Select-Object -property PSPath

$Prop = "Demo"

foreach ($item in $Paths)
{
    Get-ItemProperty -Path $item.pspath -Name $Prop -ErrorAction SilentlyContinue
}

Get-Service -Verbose


$Size = 10GB

if($Size -le 5GB)
{
    Write-Host "Girilen Size 5GBdan küçük : $($Size/1GB)" 
}
else
{
    Write-Host "Girilen Size 5GBdan büyük : $($Size/1GB)" 
 
}


$AllUsers = Get-ADUser -Filter * -Properties Department

foreach ($item in $AllUsers)
{
    if($item.Department -eq "Sales")
    {
        Write-Host "$($item.Name) adlı kullanıcının departmanı Sales'tır" -ForegroundColor Green
    }
    else
    {
        Write-Host "$($item.Name) adlı kullanıcının departmanı sales değildir"
    }
}

#Tüm servisleri bir dizide tutun ve çalışan servisleri yeşil olarak isimşerini ekranda görelim.
#Çalışmayan servisleri ise kırmızı olarak ekranda görelim.

$Servisler = Get-Service

foreach ($item in $Servisler)
{
    if($item.Status -eq "Stopped"){
        Write-Host "$($item.Name) adlı servis durmuş." -ForegroundColor Red
    }
    else
    {
        Write-Host "$($item.Name) adlı servis çalışıyor." -ForegroundColor Green
        
    }
}


#Remote

#PsRemotingEnable olması gerekir.
#Server işletim sistemi kullanıyorsanız zaten enabled.

Enable-PSRemoting -SkipNetworkProfileCheck

Enter-PSSession -ComputerName LON-DC1

$Folder = "Demo123"

Invoke-Command -ComputerName LON-DC1,LON-SVR1 -ScriptBlock {
   
   New-item -Path C:\ -Name $Using:Folder -ItemType Directory
}

#Uzak 2 makinedeki processlerden en çok cpu tüketen ilk proccesi getirin.
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 1

Invoke-Command -ComputerName LON-DC1,LON-SVR1 -Credential adatum\administrator -ScriptBlock {
    Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 1
}


powershell.exe -ExecutionPolicy ByPass -File C:\Users\Administrator.ADATUM\Desktop\Hello.ps1



Function Random-Password {
    Param(
         $Len
    )
    
   
    $PasswordList = "a","b","v","D","2","3","B","A",",","/"
     $PassL = 10
     $pass = @()
 
     for($i=1; $i -le  $Len; $i++)
     {
         $pass += Get-Random -InputObject $PasswordList
     }
 
    $pass -join ""
 
 }
 
 Random-Password -Len 2
 #Start-CustomService adında bir function oluşturun.
 #Oluşturdugunuz bu fonksiyon dışarıdan name adında bir değer alsın.
 #Sonra bu değer ismine sahip olan servisi bulun ve başlatın.
 
 
 Function Start-CustomService {
     Param(
         $Name
     )
 
     Start-Service -Name $Name
     Get-Service -Name $name
 }
 
 Start-CustomService -Name BITS

 
 Param(
    $Name
)

Write-Host "$Name"


#girilen sayıdan cpu değeri olarak büyük olanlar ekranda listelensin.

$Girdi2 = Read-Host -prompt "Değer giriniz"
$CPU = Get-Process | Where-Object {$PSItem.CPU -gt $Girdi2}


$CPU


#girilen sayıdan cpu değeri olarak büyük olanlar ekranda listelensin.

$Girdi2 = Read-Host -prompt "Değer giriniz"
$CPU = Get-Process | Sort-Object -Property CPU 

foreach($item in $CPU){
    if($item.cpu -gt $Girdi2){
        Write-Host "CPU değeri büyüktür veriden $($item.cpu) $($item.Name)"
    }
    else
    {
        Write-Host "CPU değeri küçüktür veriden $($item.cpu) $($item.Name)" 
    }
}


#Dışarıdan hangi kullanıcının departmanını kontrol etmek istiyorsak onu alalım ve departman bilgisi ile
#ismini aynı anda gösterelim.
$Kullanici = Read-Host -Prompt "Hangi kullanıcı?"
Get-ADUser -Filter * -Properties Department,Name | Where-Object {$psitem.SamAccountName -eq $Kullanici} |
    Select-Object -Property Name,Department

Get-ADUser -Identity $Kullanici -Properties Name,Department |  Select-Object -Property Name,Department




$Cevap = Read-Host -Prompt "Hangi servisi kontrol etmek istiyorsun?"



Get-Service -Name $Cevap

#Dışarıdan hangi kullanıcının departmanını kontrol etmek istiyorsak onu alalım ve departman bilgisi ile
#ismini aynı anda gösterelim.
$Kullanici = Read-Host -Prompt "Hangi kullanıcı?"
Get-ADUser -Filter * -Properties Department,Name | Where-Object {$psitem.SamAccountName -eq $Kullanici} |
    Select-Object -Property Name,Department

#girilen sayıdan cpu değeri olarak büyük olanlar ekranda listelensin.

$Len = Read-Host -Prompt "Ne kadar uzun bir şifre istiyorsun?"
  
$PasswordList = "a","b","v","D","2","3","B","A",",","/"
 $PassL = 10
 $pass = @()

 for($i=1; $i -le  $Len; $i++)
 {
     $pass += Get-Random -InputObject $PasswordList
 }

$pass -join ""


#Hangi servisin durumunu kontrol etmek istiyorsak onu dışarıdan yazalım ve çıktısı gelsin.



$Users = Import-Csv -Path C:\Demo\UserAd.csv

foreach ($item in $Users)
{
    $PasswordList = "a","b","v","D","2","3","B","A",",","/"
    $PassL = 10
    $pass = @()

    for($i=0; $i -le 12; $i++)
    {
        $pass += Get-Random -InputObject $PasswordList
    }

   $Secure =  $pass -join ""  | ConvertTo-SecureString -AsPlainText -Force

    New-ADUser -SamAccountName $item.SamAccountName `
    -Name $item.Name -GivenName $item.Name -Surname $item.SurName `
    -Department $item.Department -AccountPassword $Secure -Path "OU=ScriptUser,DC=Adatum,DC=com" `
    -UserPrincipalName "$($item.Name)@adatum.com" -Enabled $true
    

    Write-Host "$($item.Name) adlı kullanıcı oluşturulmuştur." -ForegroundColor Green
    Start-Sleep 1
}


New-ADOrganizationalUnit -Name ScriptUser
Get-ADOrganizationalUnit -Filter * | Where-Object {$PSItem.Name -eq "ScriptUser"}

"ercan" | Out-File -FilePath C:\Demo\Deneme1.txt -Append

Get-Content -Path C:\Demo\Compurers.txt

Import-Csv -Path C:\Demo\UserAd.csv


$obj += [pscustomobject]@{
    ALG = (Get-Service -Name ALG).Name
    ALGStatus = (Get-Service -Name ALG).Status
    OS = (Get-WmiObject -Class Win32_Operatingsystem).SystemDirectory
    IPAddress = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$PSItem.IPAddress -notlike "127.*"}).IPAddress
}


$Proccesses = Get-Process | Sort-Object -Property CPU
$obj = @()


foreach ($item in $Proccesses)
{
   if($item.CPU -gt 10)
   {

    $obj += [pscustomobject]@{
        Name =$item.Name
        CPI = $item.CPU
        Tag = "Red"
        }
   }
   else
   {
    $obj += [pscustomobject]@{
        Name =$item.Name
        CPI = $item.CPU
        Tag = "Green"
        }
   }
}

$obj | Sort-Object -Property tag

Get-Service -Name ALG

$Custom = '' | Select-Object -Property Name,ERcan,LastName

$Custom.ERcan = "ERcan"
$Custom.LastName = "ESE"
$Custom.Name = "Ercan"

$obj = @()

$obj += [pscustomobject]@{
    Name = "Fırat"
    LastName = "Yetkin"
}


$Servisler = Get-Service

foreach ($item in $Servisler)
{
    if($item.Status -eq "Stopped"){
        Write-Host "$($item.Name) adlı servis durmuş." -ForegroundColor Red
    }
    else
    {
        Write-Host "$($item.Name) adlı servis çalışıyor." -ForegroundColor Green
        
    }
}

#Bana cpu deperi 10dan büyük olan processleri ekranda isimleri kırmızı olarak yazın.
#cpu değeri 10dan düşükse onlarıda yeşil olarak görelim.

$Proccesses = Get-Process | Sort-Object -Property CPU

foreach ($item in $Proccesses)
{
   if($item.CPU -gt 10)
   {
        Write-Host "$($item.Name) adlı process cpu değeri 10 dan büyük. Anlık : $($item.CPU) $($item.StartTime)" -ForegroundColor Red
   }
   else
   {
        Write-Host "$($item.Name) adlı process cpu değeri 10 dan küçük. Anlık : $($item.CPU)" -ForegroundColor Green
   }
}


$PasswordList = "a","b","v","D","2","3","B","A",",","/"
$PassL = 10
$pass = @()

for($i=0; $i -le 5; $i++)
{
    $pass += Get-Random -InputObject $PasswordList
}

$pass -join ""


do {
   Write-Host  "Ercan"
   Start-Sleep 1
}
while((Get-Service -Name ALG).Status -eq "Stopped" )

$Mail = "ercan.esebilgeadam.com"
$Mail.Length

$PasswordList.Count
