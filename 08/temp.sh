#!/bin/bash

# Script: Ops 201 Class 06 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/14/23
# Purpose: System Info
#
# Resources used: google, https://devhints.io/bash, https://linuxize.com/post/bash-check-if-file-exists/

# Main


#echo "< Code Challenge 06 >"



echo -n "Enter file name: "
read FNAME  # read user input

TYPE=""
while [[ $TYPE != "f" && $TYPE != "d" ]]; do
    echo -n "Enter 'f' for file or 'd' for dir: "
    read TYPE  # read user input
done

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



# echo "*** Le Compooter ***"

# TEMP=$(lshw -class display)
# LAST3=$(echo "$TEMP" | tail -n 3) 
# echo  "$LAST3" | sed 's/ /\n\t\t/g'
 
#echo  "$TEMP"

#USER = id -u

# if (( $(id -u) == 0 ))
#   then echo "I am root"
#   else echo "No"
#   #exit
# fi
