#!/bin/bash

# Script: Ops 201 Class 07 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/14/23
# Purpose: System Info
#
# Resources used: google, https://devhints.io/bash, https://linuxize.com/post/bash-check-if-file-exists/

# Main

echo "*** Le Compooter ***"

if (( $(id -u) == 0 ))
  then echo "Root access check: OK"
  else 
        echo "Root access check: FAILED"
        echo "Please re-run this script as sudo/root"
        exit
fi


echo -e "\n> COMPUTER NAME:"
lshw | head -n 3

echo -e "\n> CPU INFO:"
lshw -class cpu | grep -v capa

echo -e "\n> RAM INFO:"
lshw -class memory | grep -A 3 "memory$"

echo -e "\n> DISPLAY ADAPTER INFO:"
lshw -class display

echo -e "\n> NETWORK ADAPTER INFO:"
lshw -class network


echo -e "\n*** Mission complete! ***\n"
# End
