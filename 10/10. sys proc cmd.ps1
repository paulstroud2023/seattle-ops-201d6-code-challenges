# Script: Ops 201 Class 10 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/17/23
# Purpose: System Process Commands
#
# Resources used: google, stackoverflow

# Main

echo "*** Go-go Powershell Rangers!  ***"


# Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
echo "> All active processes by CPU usage (high to low):"
Get-Process | Sort-Object -Property CPU -Descending

timeout /t 3


# Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
echo "> All active processes by PID (high to low):"
Get-Process | Sort-Object -Property ID -Descending

timeout /t 3


# Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
echo "> All active processes by Working Set memory usage (high to low):"
Get-Process | Sort-Object -Property WorkingSet64 -Descending | Select-Object -first 5

timeout /t 3

# Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/.
echo "> Launching Internet Explorer with OWASP URL:"
Start-Process "iexplore.exe" "https://owasp.org/www-project-top-ten/"


timeout /t 3


# Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten/.
echo "> Launching 10 more instances of Internet Explorer:"
for ($i=0; $i -lt 10; $i++)
    {
     Start-Process "iexplore.exe" "https://owasp.org/www-project-top-ten/"     
    }


timeout /t 3


# Close all Internet Explorer windows.
echo "> Closing all instances of Internet Explorer:"
Get-Process -name iexplore | Where-Object -Property ProcessName -eq iexplore | Select-Object -ExpandProperty Id | ForEach-Object { Stop-Process -Id $_ }


timeout /t 3


# Kill a process by its Process Identification Number. Choose a process whose termination won't destabilize the system, such as Internet Explorer or MS Edge. 
echo "> Starting an instance of Notepad.exe:"
Start-Process notepad.exe
echo "> 3 second timeout ..."
timeout /t 3
echo "> Killing Notepad.exe process:"
Get-Process -name notepad | Where-Object -Property ProcessName -eq notepad | Select-Object -ExpandProperty Id | ForEach-Object { Stop-Process -Id $_ }



echo "*** Script complete. ***"


# End
