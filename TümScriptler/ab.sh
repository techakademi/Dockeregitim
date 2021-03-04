#!/bin/bash                                                                                                       
#Bugun=$(date '+%d-%m-%Y');   
Bugun=$(date '+%d-%m-%Y');                                                                                     
Saat=$(date '+%H:%M');      
echo ""
echo -e "\e[31m----------------------------\e[0m"                                                      
echo -e "\e[1m|(:..:)LB Tester(:..:)|\e[0m"                                                      
echo -e "\e[31m----------------------------\e[0m" 
sleep 1
echo ""
echo -e "\e[41m\e[1mBu program eğitim amaçlı olup,sahibi olmadığınız veya yönetmediğiniz siteler üzerinde\e[0m"&&
echo -e "\e[41m\e[1mizinsiz test yapmak, yasalara aykırı olabilir.\e[0m"&&
echo ""
    while true; do
	    read -p "Bu scripti kullanma sorumluluğunu kabul ediyor musun ? Ee/Hh : " eh 
	    case $eh in
	        [Ee]* )
    echo ""
    echo "Test Adresini www.deneme.com, veya ip ve port adresi 127.0.0.1:81 şeklinde girmelisin." &&
    echo -n "Url: "
    read URL
    echo ""
    echo "İstek adetini girmelisin." &&
    echo -n "İstek Adeti: " 
    read REQ  
    echo ""
    echo "Oturum adetini girmelisin." &&
    echo -n "Oturum Adeti: " 
    read CON  
    echo ""
    echo "Test hazırlıklarına başlıyorum." &&
    echo ""
    sleep 2
    ab -n $REQ -c $CON http://$URL/ 2>&1  | tee /home/$URL-$Bugun-$Saat.txt
    sleep 1
    echo ""
    echo "Ciktilari /home/ klasörü altına $URL-$Bugun-$Saat.txt adıyla kaydettim."
    sleep 3
    echo "Umarım sonuçlar tatmin edicidir :), Hoşçakal."; break;;

            [Hh]* ) echo "Kolay gelsin görşmek üzere...";  exit;;
	         * ) 	
	    esac
    done
