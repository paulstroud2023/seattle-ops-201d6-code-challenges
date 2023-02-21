# Script: Ops 201 Class 12 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/21/23
# Purpose: Powershell IP Analysis
#
# Resources used: https://github.com/superswan/Powershell-SysAdmin, google, chatgpt

# Main

function grab_ipv4_string
        {
         return ipconfig /all | Select-String -Pattern "ipv4" | out-string
        }
                

$ping_test = "FAIL"



#$ip_addr = ipconfig /all | Select-String -Pattern "ipv4" | out-string
$ip_addr = grab_ipv4_string
# extract the IPv4 address from the string via regex match -> select second element in array
$ip_addr = $ip_addr.split(":|\(") | Select-Object -index 1
$ip_addr = $ip_addr.split(" ") # remove the leading space

echo $ip_addr

echo "Job's done!"
# End
