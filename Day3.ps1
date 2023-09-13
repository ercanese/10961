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

