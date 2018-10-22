#!/bin/bash
################################################################################
## NOT
## IN 
## USE
## All the entitys/Code below is working , just not in use in my case 
## (Switch Protocol, Component Etc... ) you can use it :)
################################################################################

# Setting up directories
# SUBDIR=raspberrypi_backups
# DIR=/hdd/$SUBDIR
SUBDIR=raspberrypi_backups
DIR=/mnt/sda3/$SUBDIR

echo "Starting RaspberryPI backup process!"

# First check if pv package is installed, if not, install it first
PACKAGESTATUS=`dpkg -s pv | grep Status`;

if [[ $PACKAGESTATUS == S* ]]
   then
      echo "Package 'pv' is installed."
   else
      echo "Package 'pv' is NOT installed."
      echo "Installing package 'pv'. Please wait..."
      sudo apt-get -y install pv
fi

# Check if backup directory exists
if [ ! -d "$DIR" ];
   then
      echo "Backup directory $DIR doesn't exist, creating it now!"
      sudo mkdir $DIR
fi

# Create a filename with datestamp for our current backup (without .img suffix)
OFILE="$DIR/backup_$(date +%Y%m%d_%H%M%S)"

# Create final filename, with suffix
OFILEFINAL=$OFILE.img

# First sync disks
sync; sync

# Shut down some services before starting backup process
echo "Stopping some services before backup."
sudo service cron stop

# Begin the backup process, should take about 1 hour from 8Gb SD card to HDD
echo "Backing up SD card to USB HDD."
echo "This will take some time depending on your SD card size and read performance. Please wait..."
SDSIZE=`sudo blockdev --getsize64 /dev/mmcblk0`;
# sudo pv -tpreb /dev/mmcblk0 -s $SDSIZE | dd of=$OFILE bs=1M conv=sync,noerror iflag=fullblock
# SDSIZE=7000000000;
       
sudo pv -tpreb /dev/mmcblk0 -s $SDSIZE | dd of=$OFILE bs=1M conv=sync,noerror iflag=fullblock
# Wait for DD to finish and catch result
RESULT=$?

# Start services again that where shutdown before backup process
echo "Start the stopped services again."
sudo service cron start

# If command has completed successfully, delete previous backups and exit
if [ $RESULT = 0 ];
   then
      echo "Successful backup, previous backup files will be deleted."
      rm -f $DIR/backup_*.tar.gz
      mv $OFILE $OFILEFINAL
      echo "Backup is being tarred. Please wait..."
      tar zcf $OFILEFINAL.tar.gz $OFILEFINAL
      rm -rf $OFILEFINAL
      echo "RaspberryPI backup process completed! FILE: $OFILEFINAL.tar.gz"
      exit 0
# Else remove attempted backup file
   else
      echo "Backup failed! Previous backup files untouched."
      echo "Please check there is sufficient space on the HDD."
      rm -f $OFILE
      echo "RaspberryPI backup process failed!"
      exit 1
fi