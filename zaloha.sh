#!/bin/bash
cas=`date +%T`
zip -r /home/student/skripty/zaloha/smehyl-$cas.zip /home/student/skripty/data
scp -i /home/student/.ssh/id.rsa /home/student/skripty/zaloha/smehyl-$cas.zip student@192.168.10.91:/home/student/Plocha/zaloha
echo "Zaloha provedena v "$cas >> /home/student/skripty/zaloha.html
echo "<br>" >> /home/student/skripty/zaloha.html
scp -i /home/student/.ssh/id.rsa /home/student/skripty/zaloha.html student@192.168.10.91:/home/student/Plocha/log/smehyl.html
