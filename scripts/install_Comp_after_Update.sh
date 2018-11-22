#!/bin/bash
#this script will install all the regular staff are needed after Update of docker 

sshpass -p UNRAIDPASSWORD ssh -o stricthostkeychecking=no UNRAIDUSER@192.168.1.201 '
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CLOUD9IDE apt-get update <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec cloud9ide apt-get update;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CLOUD9IDE apt-get install -y sshpass <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec cloud9ide apt-get install -y sshpass;

docker exec home-assistant apt-get update;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>apt-get update && install -y hddtemp sshpass zip netcat <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant apt-get install -y hddtemp sshpass zip netcat;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>cp hddtemp.db <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant cp /config/PRIVATE/hddtemp.db /etc/hddtemp.db;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>hddtemp -n /dev/sdb <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant hddtemp -n /dev/sdb;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>hddtemp -n /dev/sdc <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant hddtemp -n /dev/sdc;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>hddtemp -n /dev/sdd <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant hddtemp -n /dev/sdd;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>restart home-assistant <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker restart home-assistant;
'