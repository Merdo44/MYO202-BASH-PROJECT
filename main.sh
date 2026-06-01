#!/bin/bash
# İsim Soyisim: Mert Ali YILMAZ
# Öğrenci Numarası: 2420171021
# Sertifika Bağlantıları: Docker Temelleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=bx1hL8oPEw
#                         Siber Güvenlikte Linux İşletim Sistemleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=Yx1h8DWmem
#                         Linux Bash Script Eğitimi: https://credsverse.com/credentials/f2ab5bb4-2689-46bf-a50f-1c23b192a0e1

date '+%Y-%m-%dT%H:%M:%S' > report.log

Islemci=$(wmic cpu get name | sed -n '2p' | tr -d '\r' | xargs)
echo "Islemci - Marka Model: $Islemci" >> report.log

Ram_Detay=$(wmic memorychip get manufacturer,model,partnumber,serialnumber,capacity | sed -n '2p' | tr -d '\r' | xargs)
echo "RAM - Uretici/Model/ParcaNo/SeriNo/Kapasite: $Ram_Detay" >> report.log

Anakart_Detay=$(wmic baseboard get manufacturer,product,serialnumber | sed -n '2p' | tr -d '\r' | xargs)
echo "Anakart - Uretici/Model/SeriNo: $Anakart_Detay" >> report.log

Anakart_UUID=$(wmic csproduct get uuid | sed -n '2p' | tr -d '\r' | xargs)
echo "Anakart UUID: $Anakart_UUID" >> report.log

Disk_Bilgisi=$(wmic diskdrive get manufacturer,model,serialnumber,size | sed -n '2p' | tr -d '\r' | xargs)
echo "Disk - Marka/Model/SeriNo/Kapasite: $Disk_Bilgisi" >> report.log

Mac_Adresi=$(getmac | head -n 4 | tail -n 1 | awk '{print $1}' | tr -d '\r')
echo "MAC Adresi: $Mac_Adresi" >> report.log


read -r -s -p "Parola giriniz: " PAROLA
echo ""

echo "$PAROLA" | gpg --batch --yes --cipher-algo AES256 --passphrase-fd 0 -c report.log
rm report.log