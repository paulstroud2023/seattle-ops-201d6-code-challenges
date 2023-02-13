#!/bin/bash

# Script: Ops 201 Class 06 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/13/23
# Purpose: Conditionals
#
# Resources used: google, https://devhints.io/bash, https://linuxize.com/post/bash-check-if-file-exists/

# Main

echo "< Code Challenge 06 >"
echo -n "Enter file name: "
read FNAME  # read user input

if [[ -f $FNAME ]]  #check if file exists
  then echo "The file" $FNAME "already exists!"    
  else
    echo -n "Creating " $FNAME "..."
    touch $FNAME && echo "DONE!"
fi


echo -e "\nScript complete!\n"
# End