#!/bin/bash
echo "Konteynerleri Siliyorum"
docker rm $(docker ps -aq)
echo "Sildim :)"
