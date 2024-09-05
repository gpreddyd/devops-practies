#!/bin/bash

sdir=$1
ddir=$1
days=${3:-14} #if $3 is empty,default will be 14 days

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
