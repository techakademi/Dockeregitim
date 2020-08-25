#!/bin/bash
echo " Kontroidleri baslatiyorum"
docker run -d --restart always --network loadnet --name lb -p 81:80 lb:1
docker run -d --restart always --network loadnet --name cldzone1 -p 82:8000 cldzone-host:1
docker run -d --restart always --network loadnet --name cldzone2 -p 83:8000 cldzone-host:1
docker run -d --rm --network loadnet --name cldzone3 -p 84:8000 cldzone-host:1
docker run -d --rm --network loadnet --name cldzone4 -p 85:8000 cldzone-host:1
echo ""
echo "Konteynerleri Listeliyorum"
sleep 2
echo ""
docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}  \t{{.Status}}" --filter status=running
echo "" 
