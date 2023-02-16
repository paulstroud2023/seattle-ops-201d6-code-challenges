#!/bin/bash

# Script: Ops 201 Class 09 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/16/23
# Purpose: Log Retrieval via Powershell
#
# Resources used: google, stackoverflow

# Main

echo "*** I've got the power! 🤠 ***"


# Output all events from the System event log that occurred in the last 24 hours to a file on your desktop named last_24.txt.
echo "> System log events for the last 24 hours..."
echo "> Saving output to $env:USERPROFILE\Desktop\last_24.txt"
Get-EventLog -LogName System -after (Get-Date).AddDays(-1)   > "$env:USERPROFILE\Desktop\last_24.txt"


# Output all "error" type events from the System event log to a file on your desktop named errors.txt.
echo "> System log events with EventID 16..."
echo "> Saving output to $env:USERPROFILE\Desktop\errors.txt"
Get-EventLog -LogName System | Where-Object -Property EntryType -eq "Error" > "$env:USERPROFILE\Desktop\errors.txt"


# Print to the screen all events with ID of 16 from the System event log.
echo "> System log events with EventID 16..."
Get-EventLog -LogName System | Where-Object -Property EventID -eq 16 


# Print to the screen the most recent 20 entries from the System event log.'
echo "> 20 most recent System log events..."
Get-EventLog -LogName system -Newest 20 | Select-Object -ExpandProperty source


# Print to the screen all sources of the 500 most recent entries in the System event log
echo "> The Source field for the 500 most recent System log events..."
Get-EventLog -LogName system -Newest 500 | Select-Object -ExpandProperty source


echo -e "\n*** Job's done! ***\n"
# End
