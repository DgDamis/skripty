#!/bin/bash
echo "Dobrý den."
echo " " > odpoved
for (( i=1; i<=5; i++))
do
echo "Zadejte svůj věk."
read vek

echo $vek >> odpoved

if [ $vek -le 14 ] && [ $vek -gt 0 ]; then
	echo "Jste dítě." >> odpoved
fi
if [ $vek -ge 15 ] && [ $vek -lt 18 ]; then
	echo "Jste mladistvý." >> odpoved
fi
if [ $vek -ge 18 ] && [ $vek -le 150 ]; then
	echo "Jste dospělý." >> odpoved
fi
if [ $vek -ge 150 ]; then
	echo "To už hniješ v hrobě, no ne? :)" >> odpoved
fi
if [ $vek -lt 0 ]; then
	echo "Opravdu máš mínusový věk? To je neuvěřitelné." >> odpoved
fi
done

