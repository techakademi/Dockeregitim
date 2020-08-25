#!/bin/sh                                                                                                       
Bugun=$(date '+%d-%m-%Y');                                                                                      
Saat=$(date '+%T');                                                                                             
echo "-----------------------"                                                                                  
echo "|Merhaba Ben EchoDroid|"                                                                                  
echo "-----------------------"                                                                                  
echo -n "Isiminiz ?"                                                                                    
read isminiz                                                                                                    
echo &&                                                                                                         
echo "Memnun Oldum, $isminiz"                                                                                   
echo &&                                                                                                         
echo "Seninle Tanistigimiz Tarih:${Bugun},Saat:${Saat}"                                                         
echo &&                                                                                                         
read -t 10 -n 1 -s -r -p "On saniye Sonra kendim cikacagim, veya sen herhangi bir tusa basarak beni kapatabilirisin." 
echo &&                                                                                                         
echo "Gule Gule, $isminiz :)"