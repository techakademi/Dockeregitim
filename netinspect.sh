#!/bin/bash
echo ""
echo -e "\e[31m----------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)KontNetSpecter(:..:)|\e[0m"                                                      
echo -e "\e[31m----------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[1mNetwork tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 3

AktifNet=$(docker network ls -q | wc -l);

echo "Delta konteyner gezegeninde tespit ettiğim Network adeti: ($AktifNet)"
sleep 2
echo ""
docker network ls
echo ""
echo "Konteyner Listesini istediğin ağın adını verirmisin ?" &&
    echo -n "NET: " 
    read NET  
    docker network inspect $NET | grep -v $NET | grep Name | tr -d [:punct:]

echo "Konteynerin IP adresini görmek istersen adını vermen yeterlidir " &&
    echo -n "Konteyner: " 
    read Konteyner  
    docker inspect $Konteyner --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"
