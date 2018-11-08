#!/bin/bash
#This script backup HomeAssitant Config dir (without DB and backup folder)
#and save in local folder+in server folder- ON Linux (OR DOCKER With apt-get sshpass )
cd /config/backup/hass && zip -r "Home-Assistant-Backup-$(date +"%Y-%m-%d").zip" /config/ -x "/*tts/*" -x "*.db" -x "*.db-shm" -x "*.db-wal" -x  "/*backup/*"

sshpass -p "USER_PASSWORD" scp -r /config/backup/hass USER@192.168.X.X:/mnt/disk2/hassbackups

#if you want to run this script manualy from docker to enter your SSH password
#uncomment this lines.

#ssh -o StrictHostKeyChecking=no USER@SERVER_IP '
#cp -r /mnt/user/appdata/home-assistant/backup/hass /mnt/disk2/hassbackups '
