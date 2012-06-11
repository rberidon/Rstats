#Start
echo "##start#" >> ~/.raptor.log

#Date
echo "\"date\"=\"`date`\"" >> ~/.raptor.log

#Batteries
/usr/sbin/ioreg -l | grep -e "CycleCount" -e "Capacity" | grep -v "Legacy" | awk '{$1=$2=""; print $0}' | sed 's/^[ \t]*//' >> ~/.raptor.log


##Averages-Deprecated
#echo "\"load1\"=\"`uptime | awk '{print $10}'`\"" >> ~/.raptor.log
#echo "\"load5\"=\"`uptime | awk '{print $11}'`\"" >> ~/.raptor.log
#echo "\"load15\"=\"`uptime | awk '{print $12}'`\"" >> ~/.raptor.log
echo "\"load\"=\"`uptime | grep -o "average.*" | awk '{print $2,$3,$4}'`\"" >> ~/.raptor.log

#Uptime
echo "\"uptime\"=\"`uptime | grep -o "up.*:[0-9][0-9]"`\"" >> ~/.raptor.log
echo "\"uptime_full\"=\"`uptime`\"" >> ~/.raptor.log

#end
echo "##end#" >> ~/.raptor.log

#newline
echo >> ~/.raptor.log