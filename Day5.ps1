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