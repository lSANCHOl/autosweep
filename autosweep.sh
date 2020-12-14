#!/bin/bash


me2=$(ifconfig | grep broadcast | cut -d " " -f 10)
echo "[+Sancho's Ping Sweeper+]"
echo "YOUR IP:" ${me2}

theip=${me2%.*}
echo ${theip}

for ip in `seq 1 254`; do 
ping -c 1 ${theip}"."$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done

echo "ALL MAC ADDRESSES:"
arp -a | grep :
