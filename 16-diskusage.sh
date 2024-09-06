#!/bin/bash

diskusage=$(df -hT | grep xfs)
diskthr= 5

while IFS= read -r line
do
     if [[ $diskusage -gt $diskthr ]]
     then
     echo "the line is: $line "
     fi
done <<<$diskusage