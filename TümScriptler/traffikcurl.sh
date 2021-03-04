#!/bin/bash
echo 
rand1=$((1 + $RANDOM % 5))
echo $rand1
rand2=$((3 + $RANDOM % 7))
echo $rand2
rand3=$((5 + $RANDOM % 8))
echo $rand3
while true; do
  docker run --rm --name ithost techakademi/curl:1 -v http://www.ithostcomp.com/;
  sleep $rand1;
  docker run --rm --name techcrm techakademi/curl:1 -v http://www.techcldzone.com/;
  sleep $rand2;
  docker run --rm --name techcrm techakademi/curl:1 -v http://www.techakademivote.com/;
  sleep $rand3;
  docker run --rm --name ithost techakademi/curl:1 -v http://www.ithostcomp.com/hakkimizda.html;
  sleep $rand1;
  docker run --rm --name techcrm techakademi/curl:1 -v http://www.techcldzone.com/iletisim.html;
  sleep $rand2;
  docker run --rm --name techcrm techakademi/curl:1 -v http://www.techakademivote.com/result.html;
  sleep $rand3;
done