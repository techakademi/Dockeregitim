#!/bin/bash
echo ""
echo -e "\e[31m-------------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)Stack Image Droid(:..:)|\e[0m"                                                      
echo -e "\e[31m-------------------------------\e[0m" 
sleep 1
echo ""
echo
docker stack ls
echo "" 
echo -------------------------------------------------------
echo "---------------Stack Adini Girermisin ?----------------"
echo -------------------------------------------------------
echo -n "Stack Adi: "
read Stack
echo ""
echo ""
echo -e "\e[1mStack tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 2
echo ""
docker stack ps --format "table {{.ID}}\t{{.Name}}\t{{.Image}}\t{{.Node}}\t{{.CurrentState}}" --filter "desired-state=running" $Stack 
echo ""
echo ==========================================================================
echo -n "Bu stack'de gözlemlemek istedigin imajin (/_TAM_\) adini girermisin: "
read Imajadi
echo ""
echo -n "Bu stack'i watch komutu ile kaç saniye araliklarla gözlemlemek istersiniz: "
read GozlemSaniye
echo ""
echo -e "\e[1mGozleme basliyorum lutfen biraz bekleyiniz.\e[0m"  
sleep 2
echo ""
watch -n $GozlemSaniye "docker stack ps --format 'table {{.ID}}\t{{.Name}}\t{{.Image}}\t{{.Node}}\t{{.CurrentState}}' --filter 'desired-state=running' $Stack | grep $Imajadi"
echo ""
