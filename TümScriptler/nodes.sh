#!/bin/bash
echo ""
echo -e "\e[31m--------------------------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)Node_Konteyner_Temizleme_Droid(:..:)|\e[0m"                                                      
echo -e "\e[31m--------------------------------------------\e[0m" 
# sleep 1
echo ""
echo -e "\e[1mNode tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
echo ""
# sleep 1
echo +-------------------------------------------------------+
echo "+------------------ Mevcut Node'lar --------------------+"
echo +-------------------------------------------------------+
echo ""
docker node ls --format "table {{.Hostname}}\t{{.ManagerStatus}}\t{{.Status}}"
echo ""
sleep 1
Node=$(docker node ls --format '{{ .ID }}')
Node_ID=$(docker node inspect --format '{{ .ID }}' $Node);
Node_IP=$(docker node inspect --format '{{ .Status.Addr }}' $Node_ID);
AktifNode=$(docker node ls -q --format "{{.Hostname}} {{.Status}}" | wc -l)

read -p "Bu Node'larda, Duran Konteynerleri & Gereksiz Imajlari Temizlemek istemisin ?(E/H)" prompt

if [[ $prompt == "e" || $prompt == "E" ]]

then
    clear
    echo ""
    echo +-------------------------------------------------------+
    echo "+--------------- Node'lara Baglaniyorum ----------------+"
    echo +-------------------------------------------------------+
    sleep 1
    echo ""
    

    for sunucu in $(seq 1 $AktifNode) 

    do 

    ssh root@$Node_IP "bash /bin/konttemizle.sh"
    
    done

else
  echo Güle Güle.
fi

