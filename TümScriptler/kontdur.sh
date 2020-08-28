#!/bin/bash
echo "Konteynerleri Durduruyorum"
docker stop $(docker ps -aq) -t 0
echo "Tamamlandi :)"
sleep 1
clear
