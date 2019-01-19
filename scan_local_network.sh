#!/bin/bash

#Script to monitor the network and put changes to notification

#Save previous scan
cp /tmp/lnet_scan /tmp/lnet_scan.back

#get numeric list of online hosts
nmap -n -sn 192.168.2.* > /tmp/lnet_scan

#collect the difference, only the lines with ip-numbers
message=$(diff /tmp/lnet_scan.back /tmp/lnet_scan | grep 192)

#get first char which indicates if the host came up or went away
iostring="${message:0:1}"

#get first ip-number from the list
computer="${message:23:17}"

#show ip-number in notify if host came up
if [ "$iostring" = \> ]; then
        notify-send "$computer online" --icon=/home/gnus/nextCloud/bilder/icon/dev.png
        fi
#show ip-number in notify if host went away
if [ "$iostring" = \< ]; then
        notify-send "$computer offline" --icon=/home/gnus/nextCloud/bilder/icon/dev.png
        fi
