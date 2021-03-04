#!/bin/bash
echo ""
echo -e "\e[31m------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)KontEraserDroid(:..:)|\e[0m"                                                      
echo -e "\e[31m------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[1mKonteyner tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 3

AktifKont=$(docker ps -q | wc -l);
echo "Delta konteyner gezegeninde tespit ettiğim aktif konteyner sayısı: ($AktifKont)"
sleep 2

if [ "$AktifKont" -gt "0" ]; then
    echo ""
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"  --filter status=running
    echo ""
    echo "Silinmesini istediğin Konteynerin ID'sini verirmisin ?" &&
    echo -n "ID: " 
    read ID  
    echo "Konteyneri Durduruyorum, bu biraz zaman alabilir." &&
    docker stop $ID; echo "Konteyneri Durdurdum :)"; sleep 2; echo "Şimdi de siliyorum..."; docker rm $ID; sleep 2
    echo ""
    echo -e "\e[41m\e[1mTebrik Ederim $ID kimlik numaralı konteyner başarıyla silindi.\e[0m"
    echo ""
    read -t 10 -n 1 -s -r -p "Gemimiz on saniye sonra kendiliğinden kalkışa geçecek, veya sen herhangi bir tusa basarak kalkışımızı hızlandırabilirsin."
else
    echo ""
    echo "Delta Konteyner gezegeninde hayat yok, başka bir gezegende görüşmek üzere." ; sleep 2 &&
    echo "Hoşçakal" 
    exit 1;
fi
