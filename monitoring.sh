#!/bin/bash

echo -n -e "#Architecture: "; uname --all
echo -n -e "#CPU physical : "; grep -c "physical id" /proc/cpuinfo
echo -n -e "#vCPU : "; cat /proc/cpuinfo | grep processor | wc -l
echo -n -e "#Memory Usage: "; free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo -n -e "#Disk Usage: "; df -h | awk '$NF=="/"{printf "%d/%dGB (%s)\n", $3,$2,$5}'
echo -n -e "#CPU load: "; top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}'
echo -n -e "#Last boot: "; who -b | awk '$1=="system" {print $3 " " $4}')
echo -n -e "#LVM use: "; if cat /etc/fstab | grep --silent "/dev/mapper/"; then echo "yes"; else echo "no"; fi
echo -n -e "#Connexions TCP : "; cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}' | tr '\n' ' ' && echo "ESTABLISHED"
echo -n -e "#User log : "; w | wc -l | awk '{print$1-2}'
echo -n -e "#Network : IP " | tr '\n' ' ' && hostname -I | tr '\n' ' ' && echo -n "(" && ip link show | awk '$1=="link/ether" {print $2}'| tr '\n' ')' && printf "\n"
echo -n -e "#Sudo : "; cat /var/log/sudo/logfile | wc -l | tr '\n' ' ' && echo "cmd"
printf "\n"