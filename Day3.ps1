#Seçmek 

Get-Service | Format-Table -Property NAme,Status 

Get-Service | Select-Object -Property Name,Status
Get-Service | Select-Object -Property Name -First 10
Get-Service | Select-Object -Property Name -Last 10
Get-Service | Select-Object -Property Name -Skip 50 
Get-Service | Select-Object -Property Status -Unique


#En çok cpu tüketen ilk processin ekranda sadece cpu ve isim değerini gösterin.
Get-Process | Sort-Object -Property CPU | Select-Object -Property Name,CPU -Last 1
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -Property Name,CPU -First 1

#Ad üzerinde kullanıcıların isme göre sıralı halde ilk 10 tanesini ekranda gösteren kodu yazın.
Get-ADUser -Filter * | 
    Sort-Object -Property Name |
        Select-Object -Property Name -First 10
#AD üzerinde ne kadar benzersiz departman var ekranda göstgerin.
Get-ADUser -Filter * -Properties Department | Select-Object -Property Department -Unique

#AD üzerinde ne kadar benzersiz grup varsa isme göre sıralı olarak getirelim (Ama ad üzerinde aynı 2 grup olmaz :))
Get-ADGroup -Filter * | 
    Sort-Object | Select-Object -Property Name -Unique
#Application Eventloglardan en son gelmiş 10 logu ekranda görelim.
Get-EventLog -LogName Application | 
    Select-Object -First 10

Get-EventLog -LogName Application |  Sort-Object -Property TimeWritten -Descending |
    Select-Object -First 10

#En cok cpu tuketen 2. processi ekranda görelim.

Get-Process |
    Sort-Object -Property Cpu -Descending |
        Select-Object -Property Name,cpu -Skip 1 -First 1


Get-Service | Measure-Object
Get-ADUser -Filter * |  Measure-Object

Get-Process | Measure-Object -Property CPU -Sum -Average -Maximum -Minimum


Get-Service | Select-Object -Property NAme,Status,@{
    n="ComputernameErcan";
    e={hostname}
    }
    
    Get-Process | Select-Object -Property Name,CPU,@{
    n="2xCPU";
    e={$psitem.CPU * 2}
    }
    
    #Processlerden id değerini 10 ile çarparak yeni bir custom property oluşturun.
    Get-Process |
        Select-Object -Property CPU,Name,ID,@{
         n="10xID";
         e={$PSItem.id * 10}
        }
    
    
    Get-Process | Select-Object -Property ID,@{
    n="10*ID";
    e={$PSItem.id * 10}
    }
    
    
    #GetNetipaddress cmdletine custom olarak computername propertysini ekleyin.
    
    Get-NetIPAddress |
        Select-Object -Property IPAddress, @{
            n="ComputerName";
            e={hostname}
        }
    
    
    #Processlerden VirtualMemorySize64 propertysini 1GB a bölerek ekranda custom property olarak gösterin.
    
    Get-Process | 
        Select-Object -Property Name,@{
            n="VirtualMemorySize64GB";
            e={(($PSItem.VirtualMemorySize64 / 1024) /1024)/1024}
        }
    
    Get-Process | 
        Select-Object -Property Name,@{
            n="VirtualMemorySize64GB";
            e={($PSItem.VirtualMemorySize64 / 1GB)}
        }
    
    Get-Service -Name ALG | Select-Object -Property Name
    
    Get-NetIPAddress | Select-Object -Property IpAddress -First 1 -ExpandProperty IpAddress #Objeden property değerini ayırmak için kullanılır expandproperty.
    
    Get-Service -Name ALG | Select-Object -Property Name -ExpandProperty Name
    
    
    (Get-Service -Name ALG).Name
    
    
    Get-Disk | Get-Member
    Get-Disk | Select-Object -Property Size,FriendlyName
    
    
    Get-Disk | Select-Object -Property Size,FriendlyName,@{
        n="GBSize";
        e={($PSItem.Size / 1GB)}
    }
    
    
    Get-Command -Verb * -Noun "*Span*"
    New-TimeSpan -Start 9/1/2023 -End 9/13/2023 | Get-Member
    Get-Help -Name New-TimeSpan -Examples
    
    #Processlerin kac dakika önce başladığını ekranda gösreren komutu yazın.
    Get-Process | 
        Select-Object -Property Name,StartTime,@{
            n="ProcessAgeMin";
            e={(New-TimeSpan -Start $PSItem.StartTime -End (Get-Date)).TotalMinutes}
        }
    #AD üzerinde kullanııcların kac gün önce oluşturulduğunu yazın.
    
    Get-ADUser -Filter * -Properties * |
        Select-Object -Property Name,WhenCreated,@{
            n="AccountAge";
            e={(New-TimeSpan -Start $PSItem.WhenCreated -End (Get-Date)).TotalDays}
        }
    
    
    @{} #hash table
    
    @{
    n="ComputernameErcan";
    e={}
    }
    
    
    
    
    Get-Service | Get-Member


    
#Makine üzerinde hotfixlerin yüklü olup olmadığını belirten bir komut var onu bulun
#ve hotfixlerin ne zaman yüklendiğini gün olarak gösteren komutu yazın.
Get-Command -Verb * -Noun *Hotfix*

Get-HotFix | Select-Object -Property HotfixID,@{
    n='UpdateAge';
    e={(New-TimeSpan -Start $PSItem.InstalledOn -End (Get-Date)).Days}
}

Get-HotFix | Format-List -Property *

@{} #hash table

@{
n="ComputernameErcan";
e={}
}






#Filtreleme

Get-NetIPAddress -AddressFamily IPv4
Get-Service 
Where-Object

"Ercan" -eq "Akif" #eşittir
"Ercan" -eq "ercan"
10 -gt 9 #büyüktür
10 -gt 11
"ercan" -ceq "ercan" #büyük küçük harf eşittir
10 -lt 9 #küçüktür
"Ercan" -like "*r*" #Benzer eşittir.

Get-Service | Where-Object {$PSItem.Status -eq "Running"}

Get-Process | Where-Object {$PSItem.CPU -gt 10}  | Select-Object -Property Name,Cpu
Get-Service | Where-Object {$PSItem.Status -ne "Stopped"}

Get-Service | Where-Object {$PSItem.Name -like "A*"}
Get-Service | Where-Object {$PSItem.Name -notlike "A*"}


#StartTpe durumu Automatic olan servisleri ekranda görelim.
Get-Service | 
    Where-Object {$PSItem.StartType -eq "Automatic"} | Select-Object -Property Name,StartType
#cpu değeri 100den küçük olanları ekranda görelim.
Get-Process | Where-Object {$PSItem.CPU -lt 100} |
    Select-Object -Property name,cpu 

#Ad deki sadece security grup olan grupları ekranda görelim.
Get-ADGroup -Filter * | Where-Object {$PSItem.GroupCategory -eq "Security"} | Select-Object -Property Name,GroupCategory
Get-ADGroup -Filter *

#Process değeri 10dan büyük olanları ekranda isme göre sıralı şekilde sadece name ve cpu değeri olacak şekilde görelim
Get-Process | 
    Where-Object {$PSItem.CPU -gt 10} | 
        Sort-Object -Property Name | 
            Select-Object -Property Name,CPU
#Ad üzerinde departman bilgisi IT  olan kullanıcıları isme göre sıralı bir şekilde
#ekranda sadece name,Department olacak şekilde görelim.

Get-ADUser -Filter * -Properties Department |
    Where-Object {$PSItem.Department -eq "IT"} | 
            Sort-Object -Property Name |  
                Select-Object -Property Name,Department

#Bana sadece enable olan firewall kurallarını listeleyin.

Get-NetFirewallRule -Enabled True | Select-Object -Property Name,Enabled
Get-NetFirewallRule | 
    Where-Object {$PSItem.Enabled -eq "True"}| 
        Select-Object -Property Name,Enabled

#Deparmantmanı Sales olan kullanıcıları ekranda oluşturulma tarihi gün olarak hesaplanacak şekilde görelim.

Get-ADUser -Filter 'Department -eq "Sales"' 
Get-ADUser -Filter * -Properties Department,WhenCreated |
    Where-Object {$PSItem.Department -eq "Sales"} |
        Select-Object -Property Name,SAmAccountName,@{
            n='AccountAge';
            e={(New-TimeSpan -Start $PSItem.WhenCreated -End (Get-Date)).Days}
        }


#Dışarı Export etme


Get-Service | Where-Object {$PSItem.Status -eq "Running"}

Get-Process | Where-Object {$PSItem.CPU -gt 10}  | Select-Object -Property Name,Cpu
Get-Service | Where-Object {$PSItem.Status -ne "Stopped"}

Get-Service | Where-Object {$PSItem.Name -like "A*"}
Get-Service | Where-Object {$PSItem.Name -notlike "A*"}


#StartTpe durumu Automatic olan servisleri ekranda görelim.
Get-Service | 
    Where-Object {$PSItem.StartType -eq "Automatic"} | Select-Object -Property Name,StartType
#cpu değeri 100den küçük olanları ekranda görelim.
Get-Process | Where-Object {$PSItem.CPU -lt 100} |
    Select-Object -Property name,cpu 

#Ad deki sadece security grup olan grupları ekranda görelim.
Get-ADGroup -Filter * | Where-Object {$PSItem.GroupCategory -eq "Security"} | Select-Object -Property Name,GroupCategory
Get-ADGroup -Filter *

#Process değeri 10dan büyük olanları ekranda isme göre sıralı şekilde sadece name ve cpu değeri olacak şekilde görelim
Get-Process | 
    Where-Object {$PSItem.CPU -gt 10} | 
        Sort-Object -Property Name | 
            Select-Object -Property Name,CPU
#Ad üzerinde departman bilgisi IT  olan kullanıcıları isme göre sıralı bir şekilde
#ekranda sadece name,Department olacak şekilde görelim.

Get-ADUser -Filter * -Properties Department |
    Where-Object {$PSItem.Department -eq "IT"} | 
            Sort-Object -Property Name |  
                Select-Object -Property Name,Department

#Bana sadece enable olan firewall kurallarını listeleyin.

Get-NetFirewallRule -Enabled True | Select-Object -Property Name,Enabled
Get-NetFirewallRule | 
    Where-Object {$PSItem.Enabled -eq "True"}| 
        Select-Object -Property Name,Enabled

#Deparmantmanı Sales olan kullanıcıları ekranda oluşturulma tarihi gün olarak hesaplanacak şekilde görelim.

Get-ADUser -Filter 'Department -eq "Sales"' 
Get-ADUser -Filter * -Properties Department,WhenCreated |
    Where-Object {$PSItem.Department -eq "Sales"} |
        Select-Object -Property Name,SAmAccountName,@{
            n='AccountAge';
            e={(New-TimeSpan -Start $PSItem.WhenCreated -End (Get-Date)).Days}
        }



Get-Service | Where-Object {$PSItem.Status -eq "Stopped"} | Where-Object {$PSItem.StartType -eq "Automatic"}
Get-Service | Where-Object {$PSItem.Status -eq "Stopped" -and $PSItem.StartType -eq "Automatic" }

#city bilgisi london olupta departmanı It olan kullanıcıları ekranda departman city ve isim olarak görelim.
Get-ADUser -Filter * -Properties Department,city,name |
    Where-Object {$PSItem.City -eq "London" -and $PSItem.Department -eq "IT"} |
        Select-Object -Property Name,Department,City



#Departmanı it veya sales olan kullanıcıları ekranda yine yukaradaki propertylerde görelim.

Get-ADUser -Filter * -Properties * | Where-Object {$PSItem.Department -eq "Sales" -or $PSItem.DEpartment -eq "IT"} |
     Sort-Object -Property Name |
            Select-Object -Property Name,City,Department 

#CPU değeri 10 dan büyük olan ve isminin içerisinde A harfi geçen processleri ekranda listeleyelim.
Get-Process |
    Where-Object {$PSItem.cpu -gt 10 -and $PSItem.Name -like "*s*"}


Get-Process |
    Where-Object {$PSItem.cpu -gt 10 -and $PSItem.Name -like "*s*"} | Out-File -FilePath C:\Demo\Process.txt

Get-Process |
    Where-Object {$PSItem.cpu -gt 10 -and $PSItem.Name -like "*s*"} | Export-Csv -Path C:\Demo\process.csv -NoTypeInformation

Get-Process |
    Where-Object {$PSItem.cpu -gt 10 -and $PSItem.Name -like "*s*"} | ConvertTo-Json | Out-File -FilePath C:\Demo\Process.json

Get-Process |
    Where-Object {$PSItem.cpu -gt 10 -and $PSItem.Name -like "*s*"} | ConvertTo-Html | Out-File -FilePath C:\Demo\Process.html




#Servislerden A ile başlayanları bularak txt formatında sadece name ve startype değerini dışarı alalım.
Get-Service |
    Where-Object {$PSItem.Name -like "A*"} |
        Select-Object -Property Name,StartType |
            Out-File -FilePath C:\Demo\Service.txt

#Departmanı ıt olan kullanıcıları bularak sadece çıktı olarak Name ve departmanı csv formatında dışarı alalım.

Get-ADUser -Filter * -Properties department |
    Where-Object {$PSItem.Department -eq "IT"} | Select-Object -Property Name,Department |
        Export-Csv -Path C:\Demo\User.csv 

#Makinede bulunan volumeleri size ve freesize değerlerini gb cinsinden hesaplayarak dışarıya sadece
#Driveletter ve Size,freesize olacak şekilde json formatında dışarı alalım.

Get-Command -Verb * -Noun "*volume*"


Get-Volume | Select-Object -Property DriveLetter,Size,SizeRemaining,@{
    n='GBSize';
    e={[Math]::Round($PSItem.Size / 1GB)}
},
@{
    n='GBFreesize';
    e={$PSItem.SizeRemaining / 1GB}
} | ConvertTo-Json | Out-File -FilePath C:\Demo\Drive.json

[Math]::Round() # PowerShellde bir .Net methodu çağırmak için kullandığımız yöntem.