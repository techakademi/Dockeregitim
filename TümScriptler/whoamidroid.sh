#!/bin/bash
echo ""
echo -e "\e[31m--------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)Whoami_Droid(:..:)|\e[0m"                                                      
echo -e "\e[31m--------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[1mServis tarama işlemine başladım, lütfen biraz bekle,
birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 2
AktifServis=$(docker service ls --filter mode=global -q | wc -l)
echo ""
if [ "$AktifServis" -gt "0" ] 
then
    echo +-------------------------------------------------------+
    echo +-------Tum Calisan Global Servisleri Listeliyorum------+
    echo +-------------------------------------------------------+
    echo "Servis Sayısı: $AktifServis"
    echo ""
    docker service ls --filter mode=global --format "table {{.ID}}\t{{.Mode}}\t{{.Name}}\t{{.Replicas}}"  
    echo ""
    sleep 2
else
    echo ""
    echo "Delta Konteyner gezegeninde hayat belirtisi bulamadım, başka bir gezegende görüşmek üzere." ; sleep 2 &&
    echo "Hoşçakal" 
    exit 1;
fi
Servis=$(docker service ls --filter mode=global --format "{{.Name}}" )
AktifKont=$(docker service ps -q --format "{{.Name}} {{.Node}} {{.DesiredState}}" --filter "desired-state=running" $Servis | wc -l)
echo "+------------------------------------------------------------+"
echo "+---------------------Servis Bilgileri-----------------------+"
echo "+-$Servis    servisinde calisan task adetleri &  Node'lar---+ "     
echo "+------------------------------------------------------------+"
echo "Calisan Task Sayısı: $AktifKont"
echo ""
sleep 1
docker service ps --format "table {{.Name}}\t{{.Node}}\t{{.DesiredState}}" --filter "desired-state=running" $Servis
echo ""
echo +-------------------------------------------------------+
echo "+--------------Swarm'in Manager Bilgisi-----------------+"
echo +-------------------------------------------------------+
docker node ls -f "role=manager" --format "table {{.Hostname}}\t{{.Status}}\t{{.ManagerStatus}}"
Node=$(docker node ls -f "role=manager" --format "{{.Hostname}}")
Servis_ID=$(docker service ps --filter "desired-state=running" --filter "node=$Node" $Servis -q)
echo ""
Node_ID=$(docker inspect --format '{{ .NodeID }}' $Servis_ID)
Node_AD=$(docker node inspect --format '{{ .Description.Hostname }}' $Node_ID);
Node_IP=$(docker node inspect --format '{{ .Status.Addr }}' $Node_ID);
echo ""
echo +-------------------------------------------------------+
echo +------------------Node Detay Bilgisi-------------------+
echo +-------------------------------------------------------+
echo ""
echo $Node_AD isimli Sunucunun IP adresi: $Node_IP
echo ""
echo +-------------------------------------------------------+
echo +--------------wget ile HTTP Istegi olusturma-----------+
echo +-------------------------------------------------------+
echo ""
read -p "$Node_AD sunucusu üzerinden $Servis servisine istek göndermek istermisin. (E/H)" prompt
echo ""
sleep 1

if [[ $prompt == "e" || $prompt == "E" ]]

then
    clear
    echo ""
    echo $Node_IP:82 adresine Istek Gonderiyorum:
    sleep 1
    echo ""
    echo "wget -O $Node_IP:82"

for sorgula in $(seq 1 $AktifKont);
    do
        echo +-----------$sorgula Numarali Konteyner Bilgisi-------+
        wget  -qO - $Node_IP:82 | grep -w 'Hostname\|Host\|IP' | grep -vi "127.0.0.1" | sed 's/Hostname/Konteyner Adi/'
        echo +----------------------------------------------+
        echo ""
        sleep 2
    done
echo +--------------------------------------------------------------------------------+
echo "+10'lu ip adresleri, Virtual IP olarak konteyner'e NAT edilmis IP adresleridir.  +"
echo "+172'lu ip adresleri ise Konteyner'in kendi IP adresidir,                        +"
echo +--------------------------------------------------------------------------------+
else
  echo Güle Güle.
fi