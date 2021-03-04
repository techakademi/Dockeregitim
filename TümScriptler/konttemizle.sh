#!/bin/sh
echo "konteynerleri temizliyorum"
sleep 0.5

docker rm $(docker ps -a -q).

echo "temizleme ok!!! :)"

sleep 0.5
