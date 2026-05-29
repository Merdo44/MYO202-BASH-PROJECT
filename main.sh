#!/bin/bash
# İsim Soyisim: Mert Ali YILMAZ
# Öğrenci Numarası: 2420171021
# Sertifika Bağlantıları: Docker Temelleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=bx1hL8oPEw
#                         Siber Güvenlikte Linux İşletim Sistemleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=Yx1h8DWmem
#                         Linux Bash Script Eğitimi: https://credsverse.com/credentials/f2ab5bb4-2689-46bf-a50f-1c23b192a0e1

date '+%Y-%m-%dT%H:%M:%S' > report.log

Islemci=$(powershell.exe -Command "(Get-CimInstance Win32_Processor).Name" | tr -d '\r')
echo "Islemci: $Islemci" >> report.log

Ram_Kapasitesi=$(powershell.exe -Command "[math]::round((Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB)" | tr -d '\r')
echo "Ram: $Ram_Kapasitesi" >> report.log

Anakart=$(powershell.exe -Command "(Get-CimInstance Win32_BaseBoard).Product" | tr -d '\r')
echo "Anakart: $Anakart" >> report.log

Anakart_UUID=$(powershell.exe -Command "(Get-CimInstance Win32_ComputerSystemProduct).UUID" | tr -d '\r')
echo "Anakart UUID: $Anakart_UUID" >> report.log

Disk_Bilgisi=$(powershell.exe -Command "Get-CimInstance Win32_DiskDrive | ForEach-Object { \$_.Model + ' Kapasite: ' + [math]::round(\$_.Size / 1GB) + ' GB' }" | head -n 1 | tr -d '\r')
echo "Disk Modeli ve Boyutu: $Disk_Bilgisi" >> report.log

Mac_Adresi=$(powershell.exe -Command "(Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { \$_.IPEnabled -eq \$true }).MACAddress" | head -n 1 | tr -d '\r')
echo "MAC Adresi: $Mac_Adresi" >> report.log


read -s -p "Parola giriniz: " girilen_sifre
echo ""

PAROLA="${girilen_sifre}MYO+202"

gpg --batch --yes --cipher-algo AES256 --passphrase "$PAROLA" -c report.log

rm report.log