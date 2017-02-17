!#/bin/bash
tac /etc/group | head -n 28 | while read radek
do
uzivatel=`echo $radek | awk -F ":" '{print $1}'`
echo "Test" | write $uzivatel

done

exit
