#!/usr/bin/sh


NUMERO=$(pdfinfo $1.pdf | grep Pages | awk '{print $2}')

echo "páginas: $NUMERO"
read -p "¿imprimir páginas impares?(s/n)" RESP1
if [ "$RESP1" == "s" ]
then
	lp -o media="a5" -P $(seq -s ',' 1 2 $NUMERO) $1.pdf
fi	

echo "¿imprimir páginas pares?(s/n)"
read RESP2
if [ "$RESP2" == "s" ]
then
	lp -o media="a5" -o outputorder=reverse -P $(seq -s ',' 2 2 $NUMERO) $1.pdf
fi
