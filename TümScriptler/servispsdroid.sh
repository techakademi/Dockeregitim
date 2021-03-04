#!/bin/bash
echo ""
echo -e "\e[31m------------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)Service_PS_Droid(:..:)|\e[0m"                                                      
echo -e "\e[31m------------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[1mServis tarama işlemine başladım, lütfen biraz bekle,
birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 2
AktifServis=$(docker service ls -q | wc -l)
echo ""
if [ "$AktifServis" -gt "0" ] 
then
    echo -------------------------------------------------------
    echo ----------Tum Calisan Servisleri Listeliyorum----------
    echo -------------------------------------------------------
    echo "Servis Sayısı: $AktifServis"
    echo ""
    docker service ls --format "table {{.ID}}\t{{.Name}}\t{{.Replicas}}"
    echo ""
    sleep 1
else
    echo ""
    echo "Delta Konteyner gezegeninde hayat belirtisi bulamadım, başka bir gezegende görüşmek üzere." ; sleep 2 &&
    echo "Hoşçakal" 
    exit 1;
fi
echo -------------------------------------------------------
echo "---------------Servis Adini Girermisin ?---------------"
echo -------------------------------------------------------
echo -n "Servis: "
read Servis
echo ""
echo -------------------------------------------------------
echo -------------------Servis Bilgileri--------------------
echo -------------------------------------------------------
docker service ps --format "table {{.Name}}\t{{.Node}}\t{{.DesiredState}}" --filter "desired-state=running" $Servis
echo ""
echo -------------------------------------------------------
echo "--------------Servis'in Node ID Bilgisi----------------"
echo -------------------------------------------------------
echo -n "ID'sini istediginiz Node Adi: "
read NodeAD
Servis_ID=$(docker service ps --filter "desired-state=running" --filter "node=$NodeAD" $Servis -q);
echo ""
echo "Bu Node'un ID'si :" $(docker inspect --format '{{ .NodeID }}' $Servis_ID)
Node_ID=$(docker inspect --format '{{ .NodeID }}' $Servis_ID )
Node_AD=$(docker node inspect --format '{{ .Description.Hostname }}' $Node_ID);
Node_IP=$(docker node inspect --format '{{ .Status.Addr }}' $Node_ID);
echo ""
echo -------------------------------------------------------
echo ------------------Node Detay Bilgisi-------------------
echo -------------------------------------------------------
echo ""
echo $Node_AD isimli Sunucunun IP adresi: $Node_IP
echo ""

