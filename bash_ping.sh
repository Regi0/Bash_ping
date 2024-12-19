#!/bin/bash

ping -DOUvT tsprespec -c4 192.168.1.63 >> /home/regi/Bash_ping/Testresults/Result1.txt &
ping -DOUvT tsprespec -c4 127.0.0.1 >> /home/regi/Bash_ping/Testresults/Result2.txt &

cat /home/regi/Bash_ping/Testresults/Result1.txt >> /home/regi/Bash_ping/Testresults/Endresult.txt
echo -e "\n----- Separator -----\n" >> /home/regi/Bash_ping/Testresults/Endresult.txt
cat /home/regi/Bash_ping/Testresults/Result2.txt >> /home/regi/Bash_ping/Testresults/Endresult.txt

> /home/regi/Bash_ping/Testresults/Result1.txt
> /home/regi/Bash_ping/Testresults/Result2.txt