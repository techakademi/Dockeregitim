#!/bin/bash
echo ""
echo -e "\e[31m------------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)Stack Durum Droid(:..:)|\e[0m"                                                      
echo -e "\e[31m------------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[1mStack tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 3

docker stack ls 

echo -------------------------------------------------------
echo "---------------Stack Adini Girermisin ?---------------"
echo -------------------------------------------------------
echo -n "Stack Adi: "
read Stack
echo ""

echo -n "Bu stack'i watch komutu ile kaç saniye araliklarla gözlemlemek istersiniz: "
read GozlemSaniye
echo ""
echo -e "\e[1mGozleme basliyorum lutfen biraz bekleyiniz.\e[0m"  
sleep 3

watch -n $GozlemSaniye "docker stack ps $Stack"



