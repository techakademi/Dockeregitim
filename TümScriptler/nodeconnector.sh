#!/bin/bash
echo ""
echo -e "\e[31m--------------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)NodeConnectorDroid(:..:)|\e[0m"                                                      
echo -e "\e[31m--------------------------------\e[0m" 
sleep 1
echo ""
echo 
echo -e "\e[1mNode'a baglanmak icin Servis tarama işlemine başladım, lütfen biraz bekle birazdan sonucları goruntuleyecegim.\e[0m"  
sleep 2
AktifKont=$(docker service ls -q | wc -l);
echo ""
if [ "$AktifKont" -gt "0" ] 
then
    echo -------------------------------------------------------
    echo ----------------Servisleri Listeliyorum----------------
    echo -------------------------------------------------------
    docker service ls --format "table {{.ID}}\t{{.Name}}"
    echo ""
else
    echo ""
    echo "Delta Konteyner gezegeninde hayat yok, başka bir gezegende görüşmek üzere." ; sleep 2 &&
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
echo -------------------Node IP Bilgisi---------------------
echo -------------------------------------------------------
echo ""
echo $Node_AD isimli Sunucunun IP adresi: $Node_IP
echo ""


echo -------------------------------------------------------
echo ----------------Node Bağlantı Noktası------------------
echo -------------------------------------------------------
echo ""
read -p "$Node_AD suncusuna bağlanmak istermisin?(E/H)" prompt
if [[ $prompt == "e" || $prompt == "E" ]]

then
    ssh root@$Node_IP
    echo ""
else
  echo Güle Güle.
fi
