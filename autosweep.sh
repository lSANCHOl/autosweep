#!/bin/bash




me2=$(ifconfig | grep 192 | cut -d " " -f 10)

echo "YOUR IP:" ${me2}



if [ ${#me2} == 16 ]
then
	theip=$(echo ${me2::-6})
	echo ${theip}
	echo "ALL DEVICE IPv4:"
fi

if [ ${#me2} == 15 ]
then
	theip=$(echo ${me2::-5})
	echo ${theip}
	echo "ALL DEVICE IPv4:"
fi

if [ ${#me2} == 14 ]
then
	theip=$(echo ${me2::-4})
	echo ${theip}
	echo "ALL DEVICE IPv4:"
fi



if [ ${#me2} == 11 ]
then
	theip=$(echo ${me2::-1})
	echo ${theip}
	echo "ALL DEVICE IPv4:"
fi

if [ ${#me2} == 12 ]
then
	theip=$(echo ${me2::-2})
	echo ${theip}
	echo "ALL DEVICE IPv4:"
fi

if [ ${#me2} == 13 ]
then
	theip=$(echo ${me2::-3})
	echo ${theip}
	echo "ALL DEVICE IPv4:"
fi



for ip in `seq 1 254`; do 
ping -c 1 ${theip}$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done

echo "ALL MAC ADDRESSES:"
arp -a | grep :

