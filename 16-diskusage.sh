#!/bin/bash

diskusage= $(df -hT | grep xfs | awk -F " " '{print $6F}')
diskthr= 5

while IFS= read -r line
do
     if [ $diskusage -gt $diskthr ]
     echo "the line is: $line "
     fi
done <<<$diskusage