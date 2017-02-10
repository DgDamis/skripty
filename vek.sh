#!/bin/bash
echo "Dobrý den."
echo "Zadejte svůj věk."
read vek

if [ $vek -le 14 ] && [ $vek -gt 0 ]; then
	echo "Jste dítě."
fi
if [ $vek -ge 15 ] && [ $vek -lt 18 ]; then
	echo "Jste mladistvý."
fi
if [ $vek -ge 18 ] && [ $vek -le 150 ]; then
	echo "Jste dospělý."
fi
if [ $vek -ge 150 ]; then
	echo "To už hniješ v hrobě, no ne? :)"
fi
if [ $vek -lt 0 ]; then
	echo "Opravdu máš mínusový věk? To je neuvěřitelné."
fi
