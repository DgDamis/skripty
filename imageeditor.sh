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
callSingle
else if ($choice == 2); then
echo "Zadejte prosím cestu k adresáři."
read cesta
return $cesta
else "Zadal jste špatnou volbu."
fi
fi
}
#funkce callDirect = celý adresář
function callDirect {
taskCount=`2`
return $taskCount
}

function callSingle {
taskCount=`1`
return $taskCount
}

function imageRotation {
MIN=0
MAX=360
echo "Zadejte počet stupňů (0-360) o kolik chcete obrázek otočit."
read pocetStupnu
if ( $taskCount == 2); then
cd $cesta
#zeptat se na $3
for file in $3; do
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
convert $cesta -rotate $pocetStupnu $cesta
fi
}

function imageConversion {
}

function qualityChange {
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
	 	2) qualityChange
			;;
	 	3) sizeChange
			;;
	 	4) imageRotation ( $cesta )
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
