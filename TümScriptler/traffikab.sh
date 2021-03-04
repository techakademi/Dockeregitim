#!/bin/bash
echo 
rand1=$((10 + $RANDOM % 100))
echo $rand1
rand2=$((10 + $RANDOM % 100))
echo $rand2
rand3=$((10 + $RANDOM % 100))
echo $rand3
while true; do
  docker run --rm --name ithost techakademi/apachebench:1 -d -n $rand1 -c $rand1 http://www.ithostcomp.com/;
  sleep 7;
  docker run --rm --name techcrm techakademi/apachebench:1 -d -n $rand2 -c $rand2 http://www.cldzone.com/;
  sleep 7;
  docker run --rm --name techcrm techakademi/apachebench:1 -d -n $rand3 -c $rand3 http://www.techakademivote.com/;
  sleep 7;
done