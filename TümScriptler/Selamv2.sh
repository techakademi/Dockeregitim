#!/bin/sh
Bugun=$(date '+%d-%m-%Y');
Saat=$(date "+%H");
saat=$(date "+%T");
echo "--------------------------"
echo "|Merhaba Ben EchoDroid V2|"
echo "--------------------------"
echo -n "Isiminiz ?"
read isminiz
echo &&
if [ $Saat -ge 0 -a $Saat -lt 12 ]
then
  selamla="Gunaydin, $isminiz"
elif [ $Saat -ge 12 -a $Saat -lt 18 ]
then
  selamla="Iyi Gunler, $isminiz"
else
  selamla="Iyi Aksamlar, $isminiz"
fi
echo $selamla
echo &&
echo "Seninle Tanistigimiza Memnun Oldum, Bugunun Tarihi:${Bugun}, ve su an Saat:${saat}"
echo &&
read -t 10 -n 1 -s -r -p "On saniye Sonra kendim cikacagim, veya sen herhangi bir tusa basarak beni kapatabilirisin."
echo &&
echo "Gule Gule, $isminiz :)"
