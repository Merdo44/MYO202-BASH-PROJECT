#!/bin/bash
# İsim Soyisim: Mert Ali YILMAZ
# Öğrenci Numarası: 2420171021
# Sertifika Bağlantıları: Docker Temelleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=bx1hL8oPEw
#                         Siber Güvenlikte Linux İşletim Sistemleri: https://www.btkakademi.gov.tr/portal/certificate/validate?certificateId=Yx1h8DWmem
#                         Linux Bash Script Eğitimi: https://credsverse.com/credentials/f2ab5bb4-2689-46bf-a50f-1c23b192a0e1

date '+%Y-%m-%dT%H:%M:%S' > report.log

echo "Islemci: 13th Gen Intel(R) Core(TM) i7-13700K" >> report.log
echo "Ram: 32 GB" >> report.log
echo "Anakart: PRO Z790-P WIFI DDR4 (MS-7E06)" >> report.log
echo "UUID: DAB99063-0A8E-4A19-A6FC-047C164D13A4" >> report.log
echo "MAC Adresi: 04-7C-16-4D-13-A4" >> report.log

read -s -p "Parola girin: " girilen_sifre
echo ""

PAROLA="${girilen_sifre}MYO+202"

gpg --batch --yes --cipher-algo AES256 --passphrase "$PAROLA" -c report.log

rm report.log