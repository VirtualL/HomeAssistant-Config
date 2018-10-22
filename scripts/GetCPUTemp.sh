#!/bin/bash
#this script get CPU temp from the server (most linux will work)
sshpass -p " sshpass -p "USERPASSWORD" ssh -o StrictHostKeyChecking=no USER@192.168.1.200 'sensors |grep CPU | grep -o '[0-9][0-9].[0-9]' | head -1;'
