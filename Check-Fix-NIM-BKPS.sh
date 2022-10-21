#!/bin/bash
fecha=`date +%d``date +%m`
hostname=`uname -n`
hostname=${hostname:0:2}
echo "$hostname"
if [[ $hostname == g5 ]]
then
        ls -la /usr/local/bin
        cp /usr/local/bin/mksysbaz* /usr/local/bin/mksysbaz11
        ls -la /usr/local/bin
        cp /var/spool/cron/crontabs/root /var/spool/cron/crontabs/root_bkp_$fecha
        echo "0 3 * * 1 /usr/local/bin/mksysbaz11 2>&1 #Remove comment and define proper AZ name for the
script." >> /var/spool/cron/crontabs/root
        ./usr/local/bin/mksysbaz11 &
elif [[ $hostname == g4 ]]
then
        ls -la /usr/local/bin
        cp /usr/local/bin/mksysbaz* /usr/local/bin/mksysbaz1
        ls -la /usr/local/bin
        cp /var/spool/cron/crontabs/root /var/spool/cron/crontabs/root_bkp_$fecha
        echo "0 3 * * 1 /usr/local/bin/mksysbaz1 2>&1 #Remove comment and define proper AZ name for the
script." >> /var/spool/cron/crontabs/root
        ./usr/local/bin/mksysbaz1 &
fi
