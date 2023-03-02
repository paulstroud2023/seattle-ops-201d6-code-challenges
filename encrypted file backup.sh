#!/bin/bash

# Script: Space O data backup
# Author: Paul Stroud @ Fourward Electronics
# Date of latest revision: 03/01/23
# Purpose: File backup to an encrypted external drive
#
# Resources used: google, chatgpt

# Main

# check for root access
if (( $(id -u) == 0 ))  # UID == 0 is root/sudo
  then echo "Root access check: OK"
  else  # exit the script
        echo "Root access check: FAILED"
        echo "Please re-run this script as sudo/root"
        exit
fi

echo -e "\n> THIS SCRIPT WILL BACKUP /media/file_share TO THE SELECTED DRIVE"
sleep 3

# show linux mount point
echo -n -e "\n> THE OS IS INSTALLED ON: "
# lsblk output sanitized to only print drive name and mount point
# first awk filters out the root mount point
# second awk capitalizes the output
lsblk -l -no NAME,MOUNTPOINT | awk '$2=="/"{print $1}' | awk '{print toupper($0)}'
sleep 2

# list all drives on the system
echo "> ALL AVAILABLE DRIVES:"
lsblk -l | grep sd | nl
echo -e "\n"
sleep 2

# prompt user to select a drive
read -p "PLEASE ENTER THE DRIVE NUMBER: " DRIVE

# save sd* drive names to an array
DRV_ARRAY=($(lsblk -o NAME -nr | grep "^sd"))
# grab the selected drive name and assign to DRV_ID
DRV_ID=${DRV_ARRAY[$DRIVE-1]}


# confirm user's selection
echo -e "\n> SELECTED DRIVE = " $DRV_ID


# check if the mount point exists
# create dir if needed
if ! [[ -d /media/USB ]]  #check if dir exists
  then  
    echo -n "Creating " /media/USB "..."
    sleep 1
    mkdir /media/USB
fi

# format the external drive with a luks header
# user must enter the password
echo -e "\n> ENCRYPTING EXTERNAL STORAGE AT /dev/" $DRV_ID " ..."
sudo cryptsetup luksFormat /dev/$DRV_ID

# open the new luks volume
echo -e "\n> OPENING ENCRYPTED STORAGE ..."
sudo cryptsetup luksOpen /dev/$DRV_ID BACKUP

# the luks volume needs a filesystem
echo -e "\n> FORMATTING ENCRYPTED STORAGE w/ NTFS ..."
sudo mkfs.ntfs -f /dev/mapper/BACKUP

# mount the luks volume for file access
echo -e "\n> MOUNTING ENCRYPTED STORAGE AT /media/USB ..."
sudo mount /dev/mapper/BACKUP /media/USB

# data transfer/backup
rsync -avz --progress --stats /media/file_share /media/USB

# countdown before cleaning up
echo -e "\n> FILE BACKUP COMPLETE!"
echo -n "The script will continue in "
for i in $(seq 5 -1 1); do
   echo -n $i
   sleep 1
done

# unmount and close the luks volume
echo -e "\n> UNMOUNTING ENCRYPTED STORAGE ..."
sudo umount /media/USB 
echo -e "\n> CLOSING ENCRYPTED STORAGE ..."
sudo cryptsetup luksClose BACKUP
sleep 1

# PSA for the user
echo -e "\n> PLEASE EJECT THE DRIVE BEFORE UNPLUGGING!"
sleep 3


echo "^^^ SCRIPT COMPLETE! ^^^"

# End