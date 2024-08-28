#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
Script_name=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file="$LOG_FOLDER/$Script_name/$time_stamp.log"

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#echo "the user id is: $userid "

checkroot(){
    
    if [ $1 -ne 0 ]
then
    echo -e " $R Get the Root user Privilages $N" &>>$log_file

    exit 1
fi

}

validate(){
    if [ $1 -ne 0 ]
    then
        echo  -e "$2 is not Executed.......$R FAILURE $N " &>>$log_file
        exit 1
    else
        echo  -e "$2 is executed .......$G Success $N" &>>$log_file

    fi

}

checkroot $userid


for package in $@
do
    dnf list installing $package

    if [ $? -ne 0 ]
    then
        echo "$package is not  installed, goint to install now... " &>>$log_file
        dnf install $package -y 

        validate $? "$packageit Instalation"
    
     else
     echo -e " $package instalation is $G successsssss... $N " &>>$log_file

     fi
        
        
done

