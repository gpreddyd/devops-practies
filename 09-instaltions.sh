#!/bin/bash

userid=$(id -u)

echo "the user id is: $userid "

if [ $userid -ne 0 ]
then
    echo " Get the Root user Privilages "

    exit 1
fi

dnf install git -y 

if [ $? -ne 0 ]
then
    echo " git is not  installed, goint to install now... "
    dnf install git -y 

else
     echo " Git instalation is success..."

fi