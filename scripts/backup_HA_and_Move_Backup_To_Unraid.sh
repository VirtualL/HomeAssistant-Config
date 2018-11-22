#!/bin/bash
#This script backup HomeAssitant Config dir (without DB and backup folder)
#and save in local folder+in server folder- ON Linux (OR DOCKER With apt-get sshpass )
cd /config/backup/hass && zip -r "Home-Assistant-Backup-$(date +"%d-%m-%Y_%H:%M").zip" /config/ -x "/*tts/*" -x "*.db" -x "*.db-shm" -x "*.db-wal" -x  "/*backup/*"

sshpass -p "USER_PASSWORD" ssh -o stricthostkeychecking=no USER@192.168.1.201  'cp -r /mnt/user/appdata/home-assistant/backup/hass/* /mnt/user/hassbackups;'

#if you want to run this script manualy from docker to enter your SSH password
#uncomment this lines.

#ssh -o StrictHostKeyChecking=no USER@SERVER_IP '
#cp -r /mnt/user/appdata/home-assistant/backup/hass /mnt/disk2/hassbackups '
