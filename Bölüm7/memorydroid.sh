#!/bin/bash
docker run -d --rm --name 25_is  --memory 256M  stressdroid:1 -c 25  -t 15s
docker run -d --rm --name 50_is  --memory 256M  stressdroid:1 -c 50  -t 15s
docker run -d --rm --name 75_is  --memory 256M  stressdroid:1 -c 75  -t 15s
docker run -d --rm --name 150_is --memory 256M  stressdroid:1 -c 150 -t 15s