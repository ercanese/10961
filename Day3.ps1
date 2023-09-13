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