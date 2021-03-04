#!/bin/bash
echo ""
echo -e "\e[31m------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)ArizaDroid(:..:)|\e[0m"                                                      
echo -e "\e[31m------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[1mKonteyner tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
echo ""
sleep 1
AktifKont=$(docker ps -q | wc -l);
if [ "$AktifKont" -gt "0" ] 
then
    echo ""
    docker ps --no-trunc --format "table {{.Names}}\t{{.RunningFor}}\t{{.State}}\t{{.Status}}\t{{.Ports}}\t{{.Command}}"
    echo ""
else
    echo ""
    echo "Delta Konteyner gezegeninde hayat yok, başka bir gezegende görüşmek üzere." ; sleep 2 &&
    echo "Hoşçakal" 
    exit 1;
fi
echo ""
printf "Konteyner'da calisan uygulamanin adini belirtirmisin,\n"
    echo -n "Uygulama: "
    read Uygulama
    printf "\n"
    kontrol=$(pgrep -cf "$Uygulama")
if [ $kontrol -eq "0" ]; then
    echo "$Uygulama adinda herhangi bir islem bulunmuyor"; sleep 2 &&
    echo "Hoşçakal" 
    exit 1;
else
echo ""
echo "Su an $Uygulama'in $kontrol adet Process'i calisiyor."; sleep 2 &&
printf "$Uygulama'i durdurmadan once kac dakika beklemek istersin,\n"
echo -n "Dakika: " 
read Dakika
printf "\n"
# Saniye değişkeinni orjinal hali bu:
# saniye=$(($Dakika * 60))

# Hızlandırmak için süreyi kısaltıyorum:
saniye=$(($Dakika * 20))
printf ".............................................\n"    
printf "...$saniye Saniye sonra $Uygulama arizalanacak :[ ...\n"
printf ".............................................\n" 
printf "\n"
while [ $saniye -gt 0 ]; do
   echo -ne "$saniye\033[0K\r"
   sleep 1
   : $((saniye--))
done
echo ""
echo "Hepsini kapatiyorum"; sleep 2 && kill -9 $(ps aux | pgrep "$Uygulama" | awk '{print $2,$NF}')
printf "\n"
printf "$Uygulama adindaki uygulamayi bozdum :["
printf "\n"
sleep 3
echo ""
echo -------------------------------------------------------
echo $HOSTNAME Sunucusunda Konteynerleri listeliyorum.
echo -------------------------------------------------------
echo ""
docker ps -aq --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"
fi