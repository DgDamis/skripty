#!/bin/bash
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


volba=0

while  [ $volba != 5]
do
echo "Vítejte ve skriptu pro hromadnou úpravu fotek."
echo "Zadejte prosím zdrojový adresář."
read zdroj

echo "Zadejte prosím cílový adresář."
read cil

echo "    Zadejte volbu"
echo "(1) Konverze formátu"
echo "(2) Změna kvality"
echo "(3) Změna rozměru"
echo "(4) Otočení obrázku"
echo "(5)-------KONEC-------"
read volba

#switch

done



read stop
