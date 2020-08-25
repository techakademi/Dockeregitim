#!/bin/bash
echo "Alpine kontroidlerini Baslatiyorum"
docker run -d -it  --name alpine1 alpine
docker run -d -it  --name alpine2 alpine
docker run -d -it  --name alpine3 alpine
docker run -d -it  --name alpine4 alpine
echo "Baslatildi :)"
sleep 1
clear
