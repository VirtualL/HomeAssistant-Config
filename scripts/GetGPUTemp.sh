#!/bin/bash
#this script get GPU temp from the server (most linux will work)

sshpass -p "USERPASSWORD" ssh -o StrictHostKeyChecking=no USER@192.168.1.200 'sensors | grep temp1 | grep -o '[0-9][0-9].[0-9]' | head -1;'