#!/bin/bash

userid=$(id -u)

echo "the user id is: $userid "

if [ $userid -ne 0 ]
then
    echo " Get the Root user Privilages "
    exit 1
fi

dnf install mysql 