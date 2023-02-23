#!/bin/bash

# Script: Ops 201 Class 13 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/22/23
# Purpose: Domain analyzer
#
# Resources used: google, chatgpt

# Main

addr_check() {
              # echo $# $1
              # return
              regex="\.[a-z]{3}"
              if [[ $ADDR =~ $regex ]];
                then
                  # echo "GOOD"
                  return 0
                else
                  # echo "NO BUENO"
                  return 1
              fi
             }



echo "Knock, knock. Whois there?"

echo -n "Enter a domain/website: " && read ADDR

if [[ $(addr_check $ADDR) -eq 1 ]];
  then
    echo "Invalid domain name"
    exit
  else
    echo -n "Compiling domain info and saving it to ~/domain_info.txt ..."
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
