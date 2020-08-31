#!/bin/bash
docker run -d --rm --name 25_is  --cpus .2 --memory 256M  stressdroid:1 -c 25  -t 15s
docker run -d --rm --name 50_is  --cpus .3 --memory 256M  stressdroid:1 -c 50  -t 15s
docker run -d --rm --name 75_is  --cpus .5 --memory 512M  stressdroid:1 -c 75  -t 15s
docker run -d --rm --name 150_is --cpus  1 --memory 512M  stressdroid:1 -c 150 -t 15s