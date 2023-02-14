#!/bin/bash

# Script: Ops 201 Class 07 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/14/23
# Purpose: System Info
#
# Resources used: google, https://devhints.io/bash, https://linuxize.com/post/bash-check-if-file-exists/

# Main

echo "*** Le Compooter ***"

# check for root access
if (( $(id -u) == 0 ))  # UID == 0 is root
  then echo "Root access check: OK"
  else  # exit the script
        echo "Root access check: FAILED"
        echo "Please re-run this script as sudo/root"
        exit
fi


echo -e "\n> COMPUTER NAME:"
lshw | head -n 3  # first three lines containing computer name, etc.

echo -e "\n> CPU INFO:"
lshw -class cpu | grep -v capa  # CPU info excluding the "capabilities" section

echo -e "\n> RAM INFO:"
# RAM info, grep for the section that "memory" at EOL, print 3 lines
lshw -class memory | grep -A 3 "memory$"  

echo -e "\n> DISPLAY ADAPTER INFO:"
lshw -class display   # diplay adapter hw info

echo -e "\n> NETWORK ADAPTER INFO:"
lshw -class network   # network adapter hw info

echo -e "\n> BIOS INFO:"
# pull only Handle 0x0000, skip the first 9 lines
dmidecode -H 0000 | tail -n +9  


echo -e "\n*** Mission complete! ***\n"
# End
