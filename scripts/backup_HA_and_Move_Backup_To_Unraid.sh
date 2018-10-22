#!/bin/bash
#this script backup HomeAssitant Config dir (without DB and backup folder) 
#and save in local folder+in server folder- ON Linux (OR DOCKER With apt-get sshpass )
cd /config/backup/hass && zip -r "Home-Assistant-Backup-$(date +"%Y-%m-%d").zip" /config/ -x "/*tts/*" -x "*.db" -x "*.db-shm" -x "*.db-wal" -x  "/*backup/*"

sshpass -p "USERPASSWORD" scp -r /config/backup/hass USER@192.168.1.200:/mnt/disk2/hassbackups
