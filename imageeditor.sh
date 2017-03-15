#!/bin/bash
function basicInformations {
echo "Vítejte ve skriptu pro hromadnou úpravu fotek."
echo "Co všechno chcete upravit?"
echo "		(1) jeden obrázek	"
echo "		(2) celý adresář 	"
read choice
if ($choice == 1); then
#vyvolání funkce jenom pro jeden obrázek
echo "Zadejte prosím adresu obrázku včetně přípony."
read cesta
return $cesta
taskCount=`1`
return $taskCount
else if ($choice == 2); then
echo "Zadejte prosím cestu k adresáři."
read cesta
return $cesta
taskCount=`2`
return $taskCount
else "Zadal jste špatnou volbu."
fi
fi
}

function imageRotation {
MIN=0
MAX=360
echo "Zadejte počet stupňů (0-360) o kolik chcete obrázek otočit."
read pocetStupnu
if ( $2 == 2); then
cd $1
#zeptat se na $1
for file in $1; do
#proměnná, zkratka pro name without ending (zkratku bez koncovky)
nameWend=`$file | awk (".") '{printf $1}'`
echo $nameWend
if ($pocetStupnu > MIN $$ $pocetStupnu < MAX) ; then
convert file - rotate $pocetStupnu $nameWend.jpg
else 
echo "Nezadal jste správný počet stupňů."
fi
done
else
convert $1 -rotate $pocetStupnu $1
fi
}

function imageConversion {
}
#Musím při změně kvality i měnit formát z .png na .jpg?
function qualityChange {
MIN=0
MAX=100
echo "Na kolik procent z původní kvality chcete změnit kvalitu obrázku?"
echo "Odpovězte ve formátu celého čísla v intervalu (0;100)"
read kvalita
if ( $kvalita > MIN &&  $kvalita < MAX); then
	if ( $2 == 2 ); then
		cd $1
		for file in $1; do
		convert $file -quality $kvalita $file
	else
	convert $1 -quality $kvalita $1
	fi
	done
else
echo "Nezadal jste správnou kvalitu."
fi
}

function sizeChange {
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

if (volba > 0 && volba < 6); then  
	case "$volba" in
	 	1) imageConversion
			;;
	 	2) qualityChange ( $cesta, $taskCount )
			;;
	 	3) sizeChange 
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
