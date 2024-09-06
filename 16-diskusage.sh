#!/bin/bash

diskusage=$(df -hT | grep xfs)
diskthr=5

while IFS= read -r line
do
    usage=$(echo $line | grep xfs | awk -F " " '{print $6f}' | awk -F "%" '{print $1f}')
    partition=$(echo $line | grep xfs | awk -F " " '{print $7f}' )

     if [[ $usage -gt $diskthr ]]
     then
     echo " The $partition is more than disk $diskthr, the current value is $usage ,pls check "
     fi
done <<<$diskusage