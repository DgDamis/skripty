#!/bin/bash
cas=`date +%T`
zip -r /home/student/skripty/zaloha/smehyl-$cas.zip /home/student/skripty/data
scp -i /home/student/.ssh/id.rsa /home/student/skripty/zaloha/smehyl-$cas.zip student@192.168.10.91:/home/student/Plocha/zaloha
