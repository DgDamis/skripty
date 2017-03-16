#!/bin/bash
function basicInformations {
echo "Vítejte ve skriptu pro hromadnou úpravu fotek."
echo "Co všechno chcete upravit?"
echo "		(1) jeden obrázek	"
echo "		(2) celý adresář 	"
read choice
# Rozhodnutí o použití skriptu pouze pro jeden soubor
if ( $choice == 1 ); then
	echo "Zadejte prosím adresu obrázku včetně přípony."
	read cesta
	return $cesta
	taskCount=`1`
	return $taskCount
# Rozhodnutí o použití adresáře
else if ( $choice == 2 ); then
	echo "Zadejte prosím cestu k adresáři."
	read cesta
	return $cesta
	taskCount=`2`
	return $taskCount
else
	echo "Zadal jste špatnou volbu."
fi
}

function imageRotation {
MIN=0
MAX=360
echo "Zadejte počet stupňů (0-360) o kolik chcete obrázek otočit."
read pocetStupnu
if ( $pocetStupnu > $MIN && $pocetStupnu < $MAX ) ; then
	if ( $2 == 2 ); then
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
}

function imageConversion {
nameWend=`$file | awk (".") '{printf $1}'`
}
#Musím při změně kvality i měnit formát z .png na .jpg?
function qualityChange {
MIN=0
MAX=100
echo "Na kolik procent z původní kvality chcete změnit kvalitu obrázku?"
echo "Odpovězte ve formátu celého čísla v intervalu (0;100)"
read kvalita
if ( $kvalita > $MIN &&  $kvalita < $MAX ); then
	if ( $2 == 2 ); then
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
}

function sizeChange {
echo "Zadejte výšku obrázku, na kterou má být obrázek transformován."
read vyska
echo "Zadejte šířku obrázku, na kterou má být obrázek transformován."
read width
celyPomer=`echo $width"x"$vyska`
if ( ($width > 0 && $width < 3841 ) && ( $vyska > 0 && $vyska < 2161 ) ); then
	if ( $2 == 2 ); then
		for file in $1; do
			convert $file -resize $celyPomer $file
		done
	else
		convert $file -resize $celyPomer $file
	fi
else
	echo "Nezadal jste správné údaje!"
fi
}

function effects {
}
 
basicInformations
echo "    Zadejte volbu"
echo "(1) Konverze formátu"
echo "(2) Změna kvality"
echo "(3) Změna rozměru"
echo "(4) Otočení obrázku"
echo "(5) Efekty	"
echo "(6)-------KONEC-------"
read volba

if ( $volba > 0 && $volba < 6 ); then  
	case "$volba" in
	 	1) imageConversion
			;;
	 	2) qualityChange ( $cesta, $taskCount )
			;;
	 	3) sizeChange ( $cesta, $taskCount )
			;;
	 	4) imageRotation ( $cesta, $taskCount )
			;;
	 	5) efects
			;;
		6) exit 
			;;
	 	*) echo "Nezadal jste správný výběr."
	esac
else 
echo "Nezadal jste správný výběr."
fi
