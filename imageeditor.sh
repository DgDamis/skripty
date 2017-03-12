#!/bin/bash
function basicInformations {
echo "Vítejte ve skriptu pro hromadnou úpravu fotek."
echo "Zadejte prosím zdrojový adresář."
read zdroj
return "$zdroj"
echo "Zadejte prosím cílový adresář."
read cil
return "$cil"
}

function imageRotation {
MIN=0
MAX=360
echo "Zadejte počet stupňů (0-360) o kolik chcete obrázek otočit."
read pocetStupnu
if (pocetStupnu > MIN $$ pocetStupnu < MAX) ; then
convert $zdroj/*.jpg - rotate $pocetStupnu $cil/*.jpg
else 
echo "Nezadal jste správny vstup."
fi
exit
}

function imageConversion {
}

function qualityChange {
}

function sizeChange {
}
 
basicInformations
echo "    Zadejte volbu"
echo "(1) Konverze formátu"
echo "(2) Změna kvality"
echo "(3) Změna rozměru"
echo "(4) Otočení obrázku"
echo "(5)-------KONEC-------"
read volba

if (volba > 0 && volba < 6); then  
	case "$volba" in
	 	1) imageConversion
			;;
	 	2) qualityChange
			;;
	 	3) sizeChange
			;;
	 	4) imageRotation ($zdroj, $cil)
			;;
	 	5) exit 
			;;
	 	*) echo "Nezadal jste správný výběr."
	esac
else 
echo "Nezadal jste správný výběr."
fi
