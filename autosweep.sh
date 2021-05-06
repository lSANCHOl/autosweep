#!/bin/bash

if [ "$1" == "" ]
then
echo SYTANX: ./autosweep.sh [wifi-card]
fi

me=$(ip address | grep brd | grep "$1" | cut -d " " -f 6)


frontip=${me%.*}
backip=${frontip##*.}
subnet=${me#*/}


if [ "$subnet" == 22 ]
then
iprange=3
frontip=${frontip%.*}
for mid in `seq 0 ${iprange}`; do
for ip in `seq 1 254`; do
ping -c 1  ${frontip}"."$(( $backip + $mid ))"."$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
ping -c 1  ${frontip}"."$(( $backip - $mid ))"."$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
done
fi

if [ "$subnet" == 23 ]
then
iprange=2
frontip=${frontip%.*}
for mid in `seq 0 ${iprange}`; do
for ip in `seq 1 254`; do
ping -c 1  ${frontip}"."$(( $backip + $mid ))"."$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
ping -c 1  ${frontip}"."$(( $backip - $mid ))"."$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
done
fi

if [ "$subnet" == 24 ]
then
iprange=1
for mid in `seq 0 ${iprange}`; do
for ip in `seq 1 254`; do
ping -c 1  ${frontip}"."$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &

done
done
fi

sleep 5s
