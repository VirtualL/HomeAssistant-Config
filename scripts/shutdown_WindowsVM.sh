#!/bin/bash

#this script start WindowsVM via Unraid virsh ("Windows 10" for windowsVM) 
sshpass -p "USERPASSWORD" ssh -o StrictHostKeyChecking=no USER@192.168.1.200 'virsh shutdown "Windows 10";'