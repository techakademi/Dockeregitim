#!/bin/bash
docker run -d --rm --name Droid1 stressdroid:1 -c 20 -t 15s
docker run -d --rm --name Droid2 stressdroid:1 -c 20 -t 15s
docker run -d --rm --name Droid3 stressdroid:1 -c 20 -t 15s
docker run -d --rm --name Droid4 stressdroid:1 -c 20 -t 15s
