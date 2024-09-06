#!/bin/bash

diskusage=$(df -hT | grep xfs)
diskthr=5

while IFS= read -r line
do
    usage=$(echo $line | grep xfs | awk -F " " '{print $6f}' | awk -F "%" '{print $1f}')
    partition=$(echo $line | grep xfs | awk -F " " '{print $Nf}')

    echo " $usage"
    echo "$partition"

     if [[ $usage -gt $diskthr ]]
     then
     echo "the line is: $line "
     fi
done <<<$diskusage