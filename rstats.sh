#!/bin/sh

#Variables
LOGFILE=/Users/rayne/.rstats/`hostname -s`.log



#Start
echo "##start#" >> $LOGFILE


#Date
echo "\"date\"=\"`date`\"" >> $LOGFILE


#Batteries
/usr/sbin/ioreg -l | grep -e "CycleCount" -e "Capacity" | grep -v "Legacy" | awk '{$1=$2=""; print $0}' | sed 's/^[ \t]*//' >> $LOGFILE


##Averages-Deprecated
#echo "\"load1\"=\"`uptime | awk '{print $10}'`\"" >> $LOGFILE
#echo "\"load5\"=\"`uptime | awk '{print $11}'`\"" >> $LOGFILE
#echo "\"load15\"=\"`uptime | awk '{print $12}'`\"" >> $LOGFILE
echo "\"load\"=\"`uptime | grep -o "average.*" | awk '{print $2,$3,$4}'`\"" >> $LOGFILE


#Uptime
echo "\"uptime\"=\"`uptime | grep -o "up.*:[0-9][0-9]"`\"" >> $LOGFILE
echo "\"uptime_full\"=\"`uptime`\"" >> $LOGFILE


#IP Address
echo "\"external_ip\"=\"`curl icanhazip.com`\"" >> $LOGFILE
echo "\"wireless_ip\"=\"`ifconfig | grep -A 4 en1 | grep -E inet\ | awk '{print $2}'`\"" >> $LOGFILE
echo "\"wired_ip\"=\"`ifconfig | grep -A 4 en0 | grep -E inet\ | awk '{print $2}'`\"" >> $LOGFILE



#end
echo "##end#" >> $LOGFILE

#newline
echo >> $LOGFILE
