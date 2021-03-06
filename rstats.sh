#!/bin/sh

#Variables
LOGFILE=/Users/rayne/.rstats/logs/`cat /Users/rayne/.rstats/hostname`/`date "+%Y%m%d"`.log


#echo "\"param\"=\"value\"" >> $LOGFILE


#Start
echo "##start#" >> $LOGFILE


#Date
#Old style datestring# echo "\"date\"=\"`date`\"" >> $LOGFILE
echo "\"date\"=\"`date "+%m/%d/%Y"`\"" >> $LOGFILE
echo "\"time\"=\"`date | awk '{print $4}'`\"" >> $LOGFILE


#Batteries
/usr/sbin/ioreg -l 2>>/dev/null | grep -e "CycleCount" -e "Capacity" | grep -v "Legacy" | awk '{$1=$2=""; print $0}' | sed 's/^[ \t]*//' | sed 's/\ =\ /=/g' >> $LOGFILE


##Averages-Deprecated
#echo "\"load1\"=\"`uptime | awk '{print $10}'`\"" >> $LOGFILE
#echo "\"load5\"=\"`uptime | awk '{print $11}'`\"" >> $LOGFILE
#echo "\"load15\"=\"`uptime | awk '{print $12}'`\"" >> $LOGFILE
echo "\"load\"=\"`uptime 2>>/dev/null | grep -o "average.*" | awk '{print $2,$3,$4}'`\"" >> $LOGFILE


#Uptime
echo "\"uptime\"=\"`uptime 2>>/dev/null | grep -o "up.*:[0-9][0-9]"`\"" >> $LOGFILE
echo "\"uptime_full\"=\"`uptime 2>>/dev/null `\"" >> $LOGFILE


#Networking
echo "\"external_ip\"=\"`curl -sf icanhazip.com`\"" >> $LOGFILE
echo "\"wireless_ip\"=\"`/sbin/ifconfig 2>>/dev/null| grep -A 4 en0 | grep inet\ | awk '{print $2}'`\"" >> $LOGFILE
echo "\"wired_ip\"=\"`/sbin/ifconfig 2>>/dev/null| grep -A 4 en1 | grep inet\ | awk '{print $2}'`\"" >> $LOGFILE
echo "\"ssid\"=\"`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>>/dev/null | grep \ SSID | sed "s/[\ ]*SSID:[\ ]*//"`\"" >> $LOGFILE


#Highest-load program
program1=`ps axr -o %cpu -o command  | sed -n 2p | grep "Applications" | sed  -e 's/\.app.*//g' -e "s/\/Applications\///g" -e "s/\/Users\/rayne//g"`
echo "\"highprogram_name\"=\"`echo $program1 | awk '{$1="";print $0}' | sed 's/^[ \t]*//'`\"" >> $LOGFILE
echo "\"highprogram_cpu\"=\"`echo $program1 | awk '{print $1}'`\"" >> $LOGFILE


#Disk usage
echo "\"disk1f\"=\"`df -h | grep \/$ | awk '{print $4}'`\"" >> $LOGFILE
echo "\"disk1t\"=\"`df -h | grep \/$ | awk '{print $2}'`\"" >> $LOGFILE
echo "\"disk2f\"=\"`df -h | grep \/data$ | awk '{print $4}'`\"" >> $LOGFILE
echo "\"disk2t\"=\"`df -h | grep \/data$ | awk '{print $2}'`\"" >> $LOGFILE


#Displays
echo "\"screen_resolution_primary\"=\"`/usr/sbin/system_profiler SPDisplaysDataType 2>>/dev/null | grep Resolution | sed 's/^[[:space:]]*Resolution:\ //g' | head -n 1`\"" >> $LOGFILE

#end
echo "##end#" >> $LOGFILE

#newline
echo >> $LOGFILE
