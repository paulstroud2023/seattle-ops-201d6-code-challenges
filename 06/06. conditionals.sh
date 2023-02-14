#!/bin/bash

# Script: Ops 201 Class 06 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/14/23
# Purpose: Conditionals
#
# Resources used: google, https://devhints.io/bash, https://linuxize.com/post/bash-check-if-file-exists/

# Main

echo "< Code Challenge 06 >"
echo -n "Enter file name: "
read FNAME  # read user input

# a while loop to validate user input
TYPE=""
while [[ $TYPE != "f" && $TYPE != "d" ]]; do
    echo -n "Enter 'f' for file or 'd' for dir: "
    read TYPE  # read user input
done

# $TYPE is either 'f' or 'd'
if [[ $TYPE == "f" ]]  # if user chose 'f'
  then  # test/create a file
    if [[ -f $FNAME ]]  #check if file exists
    then echo "The file" $FNAME "already exists!"    
    else
        echo -n "Creating " $FNAME "..."
        touch $FNAME && echo "DONE!"
    fi
  else  # otherwise test/create a dir
    if [[ -d $FNAME ]]  #check if dir exists
      then echo "The dir" $FNAME "already exists!"    
      else
        echo -n "Creating " $FNAME "..."
        mkdir $FNAME && echo "DONE!"
    fi
fi


echo -e "\nScript complete!\n"
# End