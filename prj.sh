#!/bin/bash

# Script: Ops 201 Class 13 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/22/23
# Purpose: Domain analyzer
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

echo -e "THIS SCRIPT WILL BACKUP /media/file_share TO THE SELECTED DRIVE"
# echo -e "THIS SCRIPT WILL BACKUP /media/file_share"
# echo -e "TO THE SELECTED DRIVE"

echo -n -e "\nThe OS is installed on: "
lsblk -l -no NAME,MOUNTPOINT | awk '$2=="/"{print $1}' | awk '{print toupper($0)}'
echo -e "\n"

echo "All available drives:"
lsblk -l | grep sd | nl
read -p "Please enter the drive number: " DRIVE
echo "DRIVE=" $DRIVE
DRV_ARRAY=($(lsblk -o NAME -nr | grep "^sd"))

DRV_ID=${DRV_ARRAY[$DRIVE-1]}

echo -e "\n DRIVE ID = " $DRV_ID
sudo fdisk -l /dev/$DRV_ID


# for i in ${drv_array[@]}; do
#    echo -n $i " "  
# done
exit

# user prompt and input
echo -n "Enter a domain/website: " && read ADDR

# validate the domain name 
if [[ $(addr_check $ADDR) -eq 1 ]];
  then
    echo "Invalid domain name"
    exit
  else
    echo -n "Compiling domain info and saving it to ~/domain_info.txt ..."
    # run commands and save output to the text file
    echo "> WHOIS:"  > ~/domain_info.txt
    whois -H $ADDR >> ~/domain_info.txt
    echo "> DIG:" >> ~/domain_info.txt
    dig $ADDR >> ~/domain_info.txt
    echo "> HOST:" >> ~/domain_info.txt
    host $ADDR >> ~/domain_info.txt
    echo "> NSLOOKUP:" >> ~/domain_info.txt
    nslookup $ADDR >> ~/domain_info.txt
    echo "DONE!"
fi


echo -e "\n*** Mission complete! ***\n"
# End
