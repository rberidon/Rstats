Rstats
======

Stat logging for OS X for interesting look at my computer's history over time

You should change the file ```hostname``` to reflect what name you would like this computer's logs stored under.  The script uses this file because certain DHCP servers change the hostname of computers on that network, which would route logs to that (temporary) hostname's folder.  

You will also have to add this script to cron, for it to run.  Execute ```crontab -e``` and add a line similar to this: ``` * * * * * /Users/$USER/.rstats/rstats.sh ``` to run the script every minute.  You could change the first ```*``` to ```0,15,30,45``` to run it every 15 minutes, if you would like less frequent data gathering.

You can see how long the script will take to execute by running ``` time /Users/$USER/.rstats/rstats.sh ```.  On my machine, the script takes under a second.

Logging every minute for a full day (i.e. computer never went to sleep) takes about 700KB for me.  I suppose that you could move the logs to another location after the day is over, but I just leave mine.  700KB/day is about 250MB/year, so I keep all of the logs on my machine for simplicity's sake.

This script is just meant for information-gathering, so it's kind of fire-and-forget.
