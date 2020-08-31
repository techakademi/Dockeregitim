#!/bin/bash
docker run -d --rm --name 25_is  --cpu-shares 2048 --memory 256M stressdroid:1 -c 25  -t 15s
docker run -d --rm --name 50_is  --cpu-shares 1024 --memory 256M stressdroid:1 -c 50  -t 15s
docker run -d --rm --name 75_is  --cpu-shares 512  --memory 512M stressdroid:1 -c 75  -t 15s
docker run -d --rm --name 150_is --cpu-shares 256  --memory 512M stressdroid:1 -c 150 -t 15s