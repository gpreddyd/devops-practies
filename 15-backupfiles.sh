#!/bin/bash

sdir=$1
ddir=$2
days=${3:-14} #if $3 is empty,default will be 14 days
tstamp=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


#check ,source and destination are provided or not ?
usage(){

    echo  -e " $R USAGE $N:: sh backup.sd <source dir> <destionation dir >"
}


if [  $# -lt 2 ]
then
    usage
fi

if [ ! -d $sdir ]
then
    echo " $sdir doesnot exist, please check "
fi

if [ ! -d $ddir ]
then 
    echo "$ddir does not exit, pls check "
fi

files=$(find $sdir -name "*.log" -mtime +14)

if [[ ! -z $files ]]
then
    echo "files are found"
    
    zfile="$ddir/app-log.$tstamp.zip"
    find $sdir -name "*.log" -mtime +14 | zip "$zfile" -@

    if [ -f $zfile  ]
    then
        echo " the Zip file gets created $zfile "

        #remove the files
        while IFS= read -r line
        do
           echo "Deleting lines is : $line "
           rm -rf $line
        done <<<$files

    else
        echo " the zip file not gets created"
    fi
 else
    echo " files are not found older than 14 days "

 fi
