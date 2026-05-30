#!/bin/bash
# İsim Soyisim: Mert Ali YILMAZ
# Öğrenci Numarası: 2420171021
# Sertifika Bağlantıları: Docker Temelleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=bx1hL8oPEw
#                         Siber Güvenlikte Linux İşletim Sistemleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=Yx1h8DWmem
#                         Linux Bash Script Eğitimi: https://credsverse.com/credentials/f2ab5bb4-2689-46bf-a50f-1c23b192a0e1

date '+%Y-%m-%dT%H:%M:%S' > report.log

Islemci=$(wmic cpu get name | sed -n '2p' | tr -d '\r' | xargs)
echo "Islemci: $Islemci" >> report.log

Ram_Kapasitesi=$(wmic computersystem get totalphysicalmemory | sed -n '2p' | tr -d '\r' | xargs)
echo "Ram: $((Ram_Kapasitesi / 1024 / 1024 / 1024))GB" >> report.log

Anakart=$(wmic baseboard get product | sed -n '2p' | tr -d '\r' | xargs)
echo "Anakart: $Anakart" >> report.log

Anakart_UUID=$(wmic csproduct get uuid | sed -n '2p' | tr -d '\r' | xargs)
echo "Anakart UUID: $Anakart_UUID" >> report.log

Disk_Model=$(wmic diskdrive get model, serialnumber | sed -n '2p' | tr -d '\r' | xargs)
Disk_Boyutu=$(wmic diskdrive get size | sed -n '2p' | tr -d '\r' | xargs)
echo "Disk Bilgileri (Model-Seri No-Boyut): $Disk_Model $((Disk_Boyutu / 1024 / 1024 / 1024))GB" >> report.log

Mac_Adresi=$(getmac | head -n 4 | tail -n 1 | awk '{print $1}' | tr -d '\r')
echo "MAC Adresi: $Mac_Adresi" >> report.log


read -s -p "Parola giriniz: " girilen_sifre
echo ""

PAROLA="${girilen_sifre}MYO+202"

gpg --batch --yes --cipher-algo AES256 --passphrase "$PAROLA" -c report.log

rm report.log