# Script: Ops 201 Class 12 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/21/23
# Purpose: Powershell IP Analysis
#
# Resources used: https://github.com/superswan/Powershell-SysAdmin, google, chatgpt

# Main

function grab_ipv4_string # extract the line containing IPv4 from ipconfig output
        {
         return ipconfig /all | Select-String -Pattern "ipv4" | out-string
        }

function test_ping # test connectivity
        {
         return Test-Connection 8.8.8.8 -Quiet
        }
                

$ip_addr = grab_ipv4_string # save function output to a var
# extract the IPv4 address from the string via regex match -> select second element in array
$ip_addr = $ip_addr.split(":|\(") | Select-Object -index 1
$ip_addr = $ip_addr.split(" ") # remove the leading space

echo "Extracted IPv4: "
echo $ip_addr

echo "Testing network connection ... "

$ping_test = "FAIL"
if (test_ping) { $ping_test = "OK!" }

echo $ping_test

echo ""
echo "Job's done!"
# End
