#!/bin/bash

#Script to monitor the network and put changes to notification

#Save previous scan
cp /tmp/lnet_scan /tmp/lnet_scan.back

#get numeric list of online hosts
nmap -n -sn 192.168.2.* > /tmp/lnet_scan

#collect the difference, only the lines with ip-numbers
diff /tmp/lnet_scan.back /tmp/lnet_scan | grep 192 > /tmp/lnet_scan.diff
sed -i 's/ Nmap scan report for //g' /tmp/lnet_scan.diff

message=$(cat /tmp/lnet_scan.diff)

if [[ "$message" == ">"* ]]; then
	for i in $message; do
		i=${i/>/}
		notify-send "$i online" --icon=/home/gnus/nextCloud/bilder/icon/dev.png
	done
else
	for i in $message; do
		i=${i/</}
		notify-send "$i offline" --icon=/home/gnus/nextCloud/bilder/icon/dev.png
	done
fi
