#!/bin/bash

# Script: Ops 201 Class 03 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/10/23
# Purpose: Loops
#
# Resources used: google, https://devhints.io/bash

# Main

echo "[ Terminator v0.0.1 ]"
echo "Currently running processes:"
ps  # display active processes

test="y"
while [[ $test == "y" ]]; do
    echo -n "Enter a PID to terminate: "
    read input  # save the entered PID into a var
    echo -n "Killing PID" $input "..."
    kill -9 $input && echo "SUCCESS!"   # kill the process by PID

    echo -n "Terminate another PID? (y/n) "
    read test
done

echo -e "\n^^^ Job's done! ^^^\n"
# End