#!/bin/bash
#this script just reboot the access point UAP-AC-LR because there are problems of "adoption" by Unifi controller in the Docker :)
sshpass -p PASSWORD ssh -o StrictHostKeyChecking=no AP_USER@192.XXX.XXX.XXX 'reboot;'
