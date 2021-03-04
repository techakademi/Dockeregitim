#!/bin/sh
echo "Konteynerleri Listeliyorum"
echo ""
docker ps --no-trunc --format "table {{.Names}}\t{{.RunningFor}}\t{{.State}}\t{{.Status}}\t{{.Ports}}\t{{.Command}}"
echo ""
echo "Listeledim :)"