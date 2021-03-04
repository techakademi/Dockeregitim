#!/bin/bash
echo ""
echo -e "\e[31m-------------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)ServiceNetSpecter(:..:)|\e[0m"                                                      
echo -e "\e[31m-------------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[1mNode tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 3
echo ""
AktifNode=$(docker node ls -q | wc -l)
echo "$HOSTNAME konteyner gezegeninde tespit ettiğim Node adedi: ($AktifNode)"
echo ""
sleep 2

docker node ls --format 'table {{.ID}} {{if .Self}}Ben Managerim{{else}}Ben Workerim{{end}}\t{{.Hostname}}\t{{.Status}}\t{{.Availability}}'

Manager=$(docker node ls -f "role=manager" --format "{{.Hostname}}")
echo ""
echo +-------------------------------------------------------+
echo "+     Swarm'in Manager'i $Manager Sunucusudur       +"
echo +-------------------------------------------------------+

echo "Servisleri listelemek istedigin Node adını verirmisin ?" &&
echo -n "Node: " 
read Node  
echo ""
docker service ls
echo ""

# Service_IP=$(docker inspect $Servis | awk '/Addr/ {print$2}' | sed 's/\/24//g')
# echo "$Servis ismindeki servisin IP adresi : $Service_IP" 
# echo ""
# Kont_ID=$(docker ps -f name=$Servis --quiet)
# Kont_IP=$(docker inspect $Kont_ID | awk '/IPv4Address/{print$2}')
# echo ""

# # SRVC_ID=$(docker service ps $Servis --format "{{ .ID }}" --filter desired-state=running)
# # SRVC_Name=$(docker service ps $Servis --format "{{ .Name }}" --filter desired-state=running)
# Node_Name=$(docker service ps $Servis --format "{{ .Node }}" --filter desired-state=running)

# echo "Bu $Servis servisi task'i $Node_Name Sunucusu üzerinde calisiyor."


# echo "Konteynerin IP adresini görmek istersen adını vermen yeterlidir " &&
#     echo -n "Konteyner: " 
#     read Konteyner  
#     docker inspect $Konteyner --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"


