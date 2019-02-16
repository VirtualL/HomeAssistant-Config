#!/bin/bash
#Get the main disk (4TB) usage
sshpass -p "USER_PASSWORD" ssh -o stricthostkeychecking=no USER@192.XXX.XXX.XXX 'df | grep '/mnt/disk1' | grep -o '[0-9]*%' | grep -o '[0-9]*';'
