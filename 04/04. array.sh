#!/bin/bash

# Script: Ops 201 Class 04 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/09/23
# Purpose: Arrays
#
# Resources used: google, https://devhints.io/bash

# Main

test=() # initialize an empty array
for i in {1..4}; do # a short loop to create dir names
    test+=("dir"$i) # concatenate string+number
done

# echo ${test[@]} # confirm the array contents


echo "Creating directories in current path; adding a text file inside each:"
for i in ${test[@]}; do # iterate over the array
    echo -n $i" ... "   # print array element message
    mkdir $i    # create dir using array element
    echo abc123 > $i"/test.txt"  # create a new text file containing "abc123"
    echo "DONE!"
done


echo "Aaaaand it's gone!! It's all gone."
# End