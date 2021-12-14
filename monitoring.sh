#!/bin/bash

echo -n -e "#Architecture: "; uname --all
echo -n -e "#CPU physical : "; grep -c "physical id" /proc/cpuinfo
echo -n -e "#vCPU : "; cat /proc/cpuinfo | grep processor | wc -l
echo -n -e "#Memory Usage: "; free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'