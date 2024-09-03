#!/bin/bash

LOG_FOLDER="/var/log/expense-shell"
Script_name=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file="$LOG_FOLDER/$Script_name-$time_stamp.log"

mkdir -p $LOG_FOLDER

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


#echo "the user id is: $userid "

checkroot(){
    
    if [ $1 -ne 0 ]
then
    echo -e " $R Get the Root user Privilages $N" | tee -a $log_file

    exit 1
fi

}

validate(){
    if [ $1 -ne 0 ]
    then
        echo  -e "$2 is not Executed.......$R FAILURE $N " | tee -a $log_file
        exit 1
    else
        echo  -e "$2 is executed .......$G Success $N" | tee -a $log_file

    fi

}

checkroot $userid

echo "the script started execting is : $(date)" | tee -a $log_file


dnf module disable nodejs -y &>> log_file
validate $? "disable existing node Js" 

dnf module enable nodejs:20 -y &>> log_file
validate $? "enable node Js 20"

dnf install nodejs -y &>> log_file 
validate $? "install node Js" 

useradd expense
vaidate $? " Create new User " 
