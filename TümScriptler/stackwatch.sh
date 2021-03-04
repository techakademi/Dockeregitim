#!/bin/sh
echo
docker stack ls
echo 

echo -------------------------------------------------------
echo "---------------Stack Adini Girermisin ?---------------"
echo -------------------------------------------------------
echo -n "Stack Adi: "
read Stack
echo ""


docker stack ps --format "table {{.ID}}\t{{.Image}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}" $Stack