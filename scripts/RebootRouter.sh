#!/bin/bash
#this script just reboot the router to get new ip (Depending on your router)
sshpass -p " sshpass -p USERPASSWORD ssh -o StrictHostKeyChecking=no USER@192.168.1.1 'reboot;'
