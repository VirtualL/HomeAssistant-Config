#!/bin/bash
#this script backup HomeAssitant Config dir (without DB) 
#and save it in the local folder - ON Linux (OR DOCKER With apt-get sshpass )
#Make sure to Change the PASSWORD to yours.
cd /config/backup/hass && zip -P PASSWORD -r "Home-Assistant-Backup-$(date +"%d-%m-%Y_%H:%M").zip" /config/ -x "/*tts/*" -x "*.db" -x "*.db-shm" -x "*.db-wal" -x  "/*backup/*"
