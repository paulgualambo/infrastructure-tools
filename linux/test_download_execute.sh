#!/bin/bash

#Example01:
#wget -O - https://raw.githubusercontent.com/paulgualambo/linux-tool/main/test_download_execute.sh | bash -s 'paul', 'gualambo', 'giraldo'
PARAM1=$1
PARAM2=$2
PARAM3=$3

echo "PARAM1: $PARAM1 PARAM2: $PARAM2 PARAM3: $PARAM3" 
pwd