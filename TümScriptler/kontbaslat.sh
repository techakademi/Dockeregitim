#!/bin/bash
echo "Konteynerleri Baslatiyorum"
docker start $(docker ps -aq)
echo "Baslatildi :)"
sleep 3
clear
