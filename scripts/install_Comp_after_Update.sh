#!/bin/bash

#This script will install all the regular staff are needed
#And make sure that everything has been installed and operates ,
# make sure run this script manualy to enter your SSH password

#if you want to get accses to home assistant docker container CLI use this:
#docker exec -it home-assistant /bin/bash;

ssh -o StrictHostKeyChecking=no USER@SERVER_IP '
docker exec home-assistant apt-get update;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>apt-get update && install -y hddtemp sshpass zip netcat <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant apt-get install -y hddtemp sshpass zip netcat;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>cp hddtemp.db /etc <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant cp /config/PRIVATE/hddtemp.db /etc/hddtemp.db;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>hddtemp -n /dev/sdb <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant hddtemp -n /dev/sdb;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>hddtemp -n /dev/sdc <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant hddtemp -n /dev/sdc;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>hddtemp -n /dev/sdd <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant hddtemp -n /dev/sdd;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>hddtemp -n /dev/sde <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker exec home-assistant hddtemp -n /dev/sde;
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>restart home-assistant <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ";
docker restart home-assistant;
'
