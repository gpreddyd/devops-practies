#!/bin/bash

diskusage=$(df -hT | grep xfs)
diskthr=5

while IFS= read -r line
do
    usage=$(echo line | grep xfs | awk -F " " 'print {6F}')

     if [[ $usage -gt $diskthr ]]
     then
     echo "the line is: $line "
     fi
done <<<$diskusage