#!/bin/bash
function basicInformations {
echo "Vítejte ve skriptu pro hromadnou úpravu fotek."
echo "Co všechno chcete upravit?	"
echo "(1) jeden obrázek	"
echo "(2) celý adresář 	"
echo "----------------------------------"
read choice
# Rozhodnutí o použizí skriptu pro jeden soubor nebo pro celý adresář
if [[ $choice -ge '1' && $choice -le '2' ]]; then
	if [ $choice -eq 1 ]; then
		echo "Zadejte prosím adresu obrázku včetně přípony."
		read cesta
		
		taskCount=1
		echo $taskCount
		return $taskCount
		return "$cesta"
	else
		echo "Zadejte prosím cestu k adresáři."
		read cesta

		taskCount=2
		echo $taskCount
		return $taskCount
		return "$cesta"
	fi	
else
	echo "Zadal jste špatnou volbu."
fi
# post výběru který uživatele vyhodí z funkce do mainu, kde díky while neskončí skript
return $choice
}

function imageRotation {
MIN=0
MAX=360
echo $2
echo "Zadejte počet stupňů (0-360) o kolik chcete obrázek otočit."
read pocetStupnu
if [[ $pocetStupnu -gt $MIN && $pocetStupnu -lt $MAX ]] ; then
	if [ $2 -eq '2' ]; then
		cd $1
		# $1 odkazuje na první parametr, který byl funkci dán 
		for file in $1; do
		convert $file - rotate $pocetStupnu $file
		done
	else
		convert $1 -rotate $pocetStupnu $1
	fi
else 
	echo "Nezadal jste správný počet stupňů."
fi
#post výběru který uživatele vyhodí z funkce do mainu, kde díky while neskončí skript
return $pocetStupnu
}

function imageConversion {
echo "Ze kterého formátu a na který formát chcete obrázek převést?"
echo " 			(1) PNG -------> JPG "
echo "			(2) JPG -------> PNG "
read volbaKonverze
if [[ $volbaKonverze -gt '0' && $volbaKonverze -lt '3' ]]; then
	if [ $2 -eq '2' ]; then
		if [ $volbaKonverze -eq '1' ]; then
			echo $1			
			cd $1			
			for file in $1; do
				nameWend=`$file | awk -F "." '{print $1}'`				
				convert $file $nameWend".jpg"
			done
		else
			echo $1
			cd $1			
			for file in $1; do
				nameWend=`$file | awk -F "." '{print $1}'`
				convert $file $nameWend".png"
			done
		fi
	else
		if [ $volbaKonverze -eq '1' ]; then
			singFilewEnd=`$1 | awk -F "." '{print $1}'`
			convert $1 $singFilewEnd".jpg"
		else
			convert $1 $singFilewEnd".png"
		fi
	fi
else
	echo "Nemůže zvolit možnost, která není v nabídce."
fi
#post výběru který uživatele vyhodí z funkce do mainu, kde díky while neskončí skript
return $volbaKonverze
}

function qualityChange {
MIN=0
MAX=100
echo "Na kolik procent z původní kvality chcete změnit kvalitu obrázku?"
echo "Odpovězte ve formátu celého čísla v intervalu (0;100)"
read kvalita
if [[ $kvalita -gt $MIN &&  $kvalita -lt $MAX ]]; then
	if [ $2 -eq '2' ]; then
		cd $1
		for file in $1; do
			convert $file -quality $kvalita $file
		done	
	else
	convert $1 -quality $kvalita $1
	fi
else
	echo "Nezadal jste správnou kvalitu."
fi
#post výběru který uživatele vyhodí z funkce do mainu, kde díky while neskončí skript
return $kvalita
}

function sizeChange {
echo "Zadejte výšku obrázku, na kterou má být obrázek transformován."
read vyska
echo "Zadejte šířku obrázku, na kterou má být obrázek transformován."
read width
celyPomer=`echo $width"x"$vyska`
if [ [ $width -gt '0' && $width -lt '3841' ] && [ $vyska -gt '0' && $vyska -lt '2161' ] ]; then
	if [ $2 -eq '2' ]; then
		cd $1
		for file in $1; do
			convert $file -resize $celyPomer $file
		done
	else
		convert $file -resize $celyPomer $file
	fi
else
	echo "Nezadal jste správné údaje!"
fi
#post výběru který uživatele vyhodí z funkce do mainu, kde díky while neskončí skript
return $width
return $vyska
}
function effects {
echo "Který efekt chcete použít?"
echo "		(1) Charcoal		"
echo " 		(2) Implode			"
read volbaEfektu
echo "Zadejte, s jakou hrubostí chcete efekt použít."
read hrubost
if [ $volbaEfektu -gt '0' && $volbaEfektu -lt '3' ]; then
	if [ $hrubost -gt 0 ]; then
		if [ $2 -eq 2 ]; then
			cd $1
			for file in $1; do
				if [ $volbaEfektu -eq '1' ]; then
					convert $file -charcoal $hrubost $file
				else
					convert $file -implode $hrubost $file
				fi
			done
		else
			if [ $volbaEfektu -eq '1' ]; then
				convert $1 -charcoal $hrubost $1
			else
				convert $1 -implode $hrubost $1
			fi
		fi
	else
		echo "Nemůžete zadat mínusovou hrubost."
	fi
	#post výběru který uživatele vyhodí z funkce do mainu, kde díky while neskončí skript
	return $hrubost
else
	echo "Nemůžete použít jiný efekt, než který je v nabídce."
fi
#post výběru který uživatele vyhodí z funkce do mainu, kde díky while neskončí skript
return $volbaEfektu
}
while :; do 
basicInformations
echo "    Zadejte volbu"
echo "(1) Konverze formátu"
echo "(2) Změna kvality"
echo "(3) Změna rozměru"
echo "(4) Otočení obrázku"
echo "(5) Efekty	"
echo "(6)-------KONEC-------"
read volba

if [[ $volba -gt '0' && $volba -lt '7' ]]; then  
	case "$volba" in
	 	1) 
		imageConversion "$cesta" "$taskCount"
			;;
	 	2) 
		qualityChange "$cesta" "$taskCount"
			;;
	 	3) 
		sizeChange "$cesta" "$taskCount"
			;;
	 	4) 
		imageRotation "$cesta" "$taskCount"
			;;
	 	5) 
		efects "$cesta" "$taskCount"
			;;
		6) exit 
			;;
	 	*) echo "Nezadal jste správný výběr."
	esac
else 
echo "Nezadal jste správný výběr."
fi
done
