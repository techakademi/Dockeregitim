#!/bin/bash
echo "Konteynerleri Baslatiyorum"
docker start $(docker ps -aq)
echo "Baslatildi :)"
