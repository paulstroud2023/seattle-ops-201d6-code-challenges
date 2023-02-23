#!/bin/bash

# Script: Ops 201 Class 13 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/22/23
# Purpose: Domain analyzer
#
# Resources used: google, chatgpt

# Main

# a function to check whether the domain name is valid
addr_check() {
              # a regex to match top level domain;
              # for some reason it doesn't work with *
              regex="\.[a-z]{3}"  
              
              # compare function argument string to regex
              if [[ $1 =~ $regex ]];
                then
                  return 0  # return 0 = OK
                else
                  return 1  # return 1 = ERROR
              fi
             }



echo "Knock, knock. Whois there?"

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
