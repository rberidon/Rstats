#!/bin/sh
#Start
echo "##start#" >> `hostname -s`.log

#Date
echo "\"date\"=\"`date`\"" >> `hostname -s`.log

#Batteries
/usr/sbin/ioreg -l | grep -e "CycleCount" -e "Capacity" | grep -v "Legacy" | awk '{$1=$2=""; print $0}' | sed 's/^[ \t]*//' >> `hostname -s`.log


##Averages-Deprecated
#echo "\"load1\"=\"`uptime | awk '{print $10}'`\"" >> `hostname -s`.log
#echo "\"load5\"=\"`uptime | awk '{print $11}'`\"" >> `hostname -s`.log
#echo "\"load15\"=\"`uptime | awk '{print $12}'`\"" >> `hostname -s`.log
echo "\"load\"=\"`uptime | grep -o "average.*" | awk '{print $2,$3,$4}'`\"" >> `hostname -s`.log

#Uptime
echo "\"uptime\"=\"`uptime | grep -o "up.*:[0-9][0-9]"`\"" >> `hostname -s`.log
echo "\"uptime_full\"=\"`uptime`\"" >> `hostname -s`.log

#end
echo "##end#" >> `hostname -s`.log

#newline
echo >> `hostname -s`.log
