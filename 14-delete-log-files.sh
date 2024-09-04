#!/bin/bash

source_dir=/home/ec2-user/logs
 
 if [ -d $source_dir ]
 then 
     echo " source direcoty exists $source_dir "
 else
    echo " Source directory does not exists "
    exit 1
  
  fi

files=$(find $source_dir -name "*.log" -mtime +14)

echo " files :$files "