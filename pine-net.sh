#!/bin/bash
echo "Pine-net Netwörkünde dört adet kontroid Baslatiyorum"
docker run -d -it --name alpine1 --network pine-net alpine
docker run -d -it --name alpine2 --network pine-net alpine
docker run -d -it --name alpine3 alpine
docker run -d -it --name alpine4 --network pine-net alpine
echo "Baslatildi :)"
sleep 1
clear