#!/bin/sh
Bugun=$(date '+%d-%m-%Y');
Saat=$(date "+%H");
saat=$(date "+%T");
Yil=$(date '+%Y');
Ay=$(date '+%m');
echo "--------------------------"
echo "|Merhaba Ben EchoDroid V3|"
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
echo -e "\033[1mSeninle Tanistigimiza Memnun Oldum $isminiz, Bugunun Tarihi:${Bugun}, ve su an Saat:${saat}\033[0m"
echo &&
echo "Dogum yilini ve ayini verirsen bana, sana ne kadar zamandir bu gezegende oldugunu hesaplayabilirim."
echo &&
read -p "Dogum Yilini girermisin. Ornegin 1960 :" yasyil
echo &&
read -p "Dogum Ayini  girermisin. Ornegin   01 :" yasay

yilyas=$(($Yil-$yasyil))
yilay=$(($Ay-$yasay))

if [ $yilay -lt 0 ] ; then
    yilay=$(($Ay-$yasay+12))
else    
    yilay=$(($Ay-$yasay))
fi
echo &&
echo -e "\e[44m\e[1mTebrik Ederim $isminiz, $yilyas Yil ve $yilay Ay'dir Dunyadasin.\e[0m"
echo &&
read -t 10 -n 1 -s -r -p "On saniye Sonra kendim cikacagim, veya sen herhangi bir tusa basarak beni kapatabilirisin."
echo &&
echo "Gule Gule, $isminiz :)"
