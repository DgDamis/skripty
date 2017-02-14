#!/bin/bash
ip=`ifconfig | grep "inet adr" | awk -F ":" '{print $2}'` 
ip=`echo $ip | awk -F " " '{print $1}'`
echo "Moje IP: $ip"

p_bajty=`ifconfig | grep "Přijato" | awk -F "(" '{print $1}'`
p_bajty=`echo $p_bajty | awk -F "Přijato " '{print $2}'`
echo "Přijato "$p_bajty
o_bajty=`ifconfig | grep "Odesláno" | awk -F ")" '{print $2}'`
o_bajty=`echo $o_bajty | awk -F "(" '{print $1}'`
echo $o_bajty
