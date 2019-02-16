#!/bin/bash
#Get the ssd usage from the unraid server
sshpass -p USERPASSWORD ssh -o stricthostkeychecking=no root@192.XXX.XXX.XXX 'df | grep '/mnt/cache' | grep -o '[0-9]*%' | grep -o '[0-9]*';'
