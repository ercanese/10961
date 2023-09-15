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