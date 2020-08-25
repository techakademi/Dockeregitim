#!/bin/bash
echo "Imajlari listeliyorum " && echo "Unutm varsayilan olarak 100 adet imaj listeliyor Docker API'si"
CURL="curl -k -X GET https://hub.dckrsrv.lcl:5000/v2/_catalog"
echo $CURL
