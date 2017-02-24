#!/bin/bash

cas=`date +%T" "%D`
ip=`ifconfig | grep Všesměr | awk -F ":" '{print $2}' | awk -F " " '{print $1}'`
rx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $2}' | awk -F ")" '{print $1}'`
tx=`ifconfig eth0 | grep Přijato | awk -F "(" '{print $3}' | awk -F ")" '{print $1}'`
un=`who | wc -l `
du=`df -h | grep sda | awk -F " " '{print $3}'`
da=`df -h | grep sda | awk -F " " '{printf $4}'`
um=`free -m | grep Mem: | awk -F " " '{print $3}'`
fm=`free -m | grep Mem: | awk -F " " '{print $4}'`
echo "Aktuální čas: "$cas >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "Moje IP: "$ip >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "Přijatá data: "$rx >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "Odeslaná data: "$tx >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "Počet přihlášených uživatelů: "$un >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "Využité místo na disku: "$du >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "Volné místo na disku: "$da >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "Využitá RAM: "$um" MB" >> /home/student/skripty/index.html
echo "<br>" >> /home/student/skripty/index.html
echo "volná RAM: "$fm" MB" >> /home/student/skripty/index.html
echo "<br><hr>" >> /home/student/skripty/index.html
