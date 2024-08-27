#!/bin/bash

userid=$(id -u)

#echo "the user id is: $userid "

checkroot(){
    
    if [ $1 -ne 0 ]
then
    echo " Get the Root user Privilages "

    exit 1
fi

}

validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is not Executed.......FAILURE "
        exit 1
    else
        echo "$2 is executed .......Success "

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
     echo " Git instalation is successsssss..."

fi

dnf list installing mysql -y 

if [ $? -ne 0 ]
then
    echo " mysql is not  installed, goint to install now... "
    dnf install mysql -y 
    validate $1 "mysql instaltion"
else
     echo " mysql instalation is successsssss..."

fi