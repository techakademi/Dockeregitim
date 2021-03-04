#!/bin/sh

docker rmi -f $(docker images -qf dangling=true)

echo "temizleme ok!!! :)"

sleep 2
