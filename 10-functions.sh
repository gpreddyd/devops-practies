#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\"e[32m"
Y="\e[33m"
N="\e[0m"

#echo "the user id is: $userid "

checkroot(){
    
    if [ $1 -ne 0 ]
then
    echo -e " $R Get the Root user Privilages $N"

    exit 1
fi

}

validate(){
    if [ $1 -ne 0 ]
    then
        echo  -e "$2 is not Executed.......$R FAILURE $N "
        exit 1
    else
        echo  -e "$2 is executed .......$G Success $N"

    fi

}

checkroot $userid

dnf list instaling git 



if [ $? -ne 0 ]
then
    echo " git is not  installed, goint to install now... "
    dnf install git -y 

    validate $? "Git Instalation"
    
else
     echo -e " Git instalation is $G successsssss... $N "

fi

dnf list installing mysql -y 

if [ $? -ne 0 ]
then
    echo " mysql is not  installed, goint to install now... "
    dnf install mysql -y 
    validate $1 "mysql instaltion"
else
     echo -e " mysql instalation is $G successsssss... $N "

fi