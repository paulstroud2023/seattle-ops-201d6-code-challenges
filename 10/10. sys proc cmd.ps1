# Script: Ops 201 Class 09 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/16/23
# Purpose: Log Retrieval via Powershell
#
# Resources used: google, stackoverflow

# Main

echo "*** I've got the power! 🤠 ***"




# Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
Get-Process | Sort-Object -Property CPU -Descending



# Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
Get-Process | Sort-Object -Property ID -Descending


# Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
Get-Process | Sort-Object -Property WorkingSet64 -Descending | Select-Object -first 5


# Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/.
Start-Process "iexplore.exe" "https://owasp.org/www-project-top-ten/"

# Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten/.
for ($i=0; $i -lt 10; $i++)
    {
     Start-Process "iexplore.exe" "https://owasp.org/www-project-top-ten/"     
    }





# Close all Internet Explorer windows.



# Kill a process by its Process Identification Number. Choose a process whose termination won't destabilize the system, such as Internet Explorer or MS Edge. 
Start-Process notepad.exe
 







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
