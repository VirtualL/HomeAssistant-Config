#!/bin/bash
#this script start WindowsVM via Unraid virsh ("Windows 10" for windowsVM) 
sshpass -p "USERPASSWORD" ssh -o StrictHostKeyChecking=no USER@192.168.X.X 'virsh start "Windows 10";'


#this script start WindowsVM via proxomox vmid (101 for windowsVM in my case)
#sshpass -p "USERPASSWORD" ssh -o StrictHostKeyChecking=no USER@192.168.X.X 'qm start 101;'
