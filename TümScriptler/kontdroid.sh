#!/bin/sh
echo ""
echo -e "\e[31m----------------------------\e[0m"    
echo -e "\e[1m|(:..:)KontExternator(:..:)|\e[0m"                                                                                                       
echo -e "\e[31m----------------------------\e[0m" 
echo ""
echo -e "\e[41m\e[1mBen bir konteyner yok edicisi Droid'im,\e[0m"&&
echo -e "\e[41m\e[1mBenimle çalışırken dikkatli olmanı öneririm !!!.\e[0m"
sleep 1
echo ""
echo -e "\e[1mKonteyner tarama işlemine başladım, lütfen biraz bekle birazdan sonuçları görüntüleyeceğim.\e[0m"  
sleep 3
echo ""

AktifKont=$(docker ps -q  | wc -l);

if [ "$AktifKont" -gt "0" ]; then

    echo "Delta konteyner gezegeninde tespit ettiğim aktif konteynerleri listeliyorum:"
    echo ""
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"  --filter status=running 
    echo ""
    echo "Ayrıca bu gezegende ki pasif konteynerler:"
    echo ""
    docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"  --filter status=exited 
    echo ""

    while true; do
	    read -p "Tüm Konteynerleri imha etmeyi onaylıyormusun ? Ee/Hh : " eh 
	    case $eh in
	        [Ee]* ) echo "Konteynerleri durduruyorum"; sleep 1 && docker kill $(docker ps -aq) && echo -e "Tüm konteynerleri durdurdum"; sleep 2 &&  echo "Şimdi de silme işlemini gerçekleştiriyorum"; sleep 2 && docker rm $(docker ps -aq); break;;
            [Hh]* ) echo "Umarım doğru bir karar vermişsindir...";  exit;;
	         * ) 	
	    esac
    done
    echo -e "\e[41m\e[1mTebrik Ederim bu gezegendeki konteynerleri başarıyla imha ettin.\e[0m"
    read -t 10 -n 1 -s -r -p "Gemimiz on saniye sonra kendiliğinden kalkışa geçecek, veya sen herhangi bir tusa basarak kalkışımızı hızlandırabilirsin."
else
    echo "Delta Konteyner gezegeninde hayat yok, başka bir gezegende görüşmek üzere." ; sleep 2 &&
    echo "Hoşçakal" 
    exit 1;
fi