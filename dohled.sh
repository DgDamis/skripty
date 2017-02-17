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
echo "Aktuální čas: "$cas
echo "Moje IP: "$ip
echo "Přijatá data: "$rx
echo "Odeslaná data: "$tx

echo "Počet přihlášených uživatelů: "$un
echo "Využité místo na disku: "$du
echo "Volné místo na disku: "$da
echo "Využitá RAM: "$um" MB"
echo "volná RAM: "$fm" MB"
