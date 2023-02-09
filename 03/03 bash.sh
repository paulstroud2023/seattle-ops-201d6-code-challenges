#!/bin/bash

# Script: Ops 201 Class 03 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/08/23
# Purpose: Basic script functions


# Main

user_login() {
              # if no args, display 3 lines
              if [ $# == 0 ] 
                then last -n 3 #
              else # pass the arg as the number of lines
                last -n $1
              fi
             }

# call the function w/ the script arg (if any)
user_login $1

echo "All done!"
# End