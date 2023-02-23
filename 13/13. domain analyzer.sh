#!/bin/bash

# Script: Ops 201 Class 13 Ops Challenge Solution
# Author: Paul Stroud
# Date of latest revision: 02/22/23
# Purpose: Domain analyzer
#
# Resources used: google, https://devhints.io/bash, https://linuxize.com/post/bash-check-if-file-exists/

# Main

addr_check() {
              if [[ $1 =~ "w+\.[a-z]{3}" ]]
                then
                    echo $1
                    return 0

                else
                  echo "1"
                  return 1
              fi
              return
             }



echo "Knock, knock. Whois there?"

echo -n "Enter a domain/website: " && read ADDR

#whois -h $ADDR
echo [[ $(addr_check $ADDR) -eq 0 ]]

exit


# check for root access
if (( $(id -u) == 0 ))  # UID == 0 is root
  then echo "Root access check: OK"
  else  # exit the script
        echo "Root access check: FAILED"
        echo "Please re-run this script as sudo/root"
        exit
fi



echo -e "\n*** Mission complete! ***\n"
# End
