#!/bin/bash

userid=$(id -u)

#echo "the user id is: $userid "

validate(){
    if [ $1 -ne 0 ]
    then
        echo "The command is not Executed.......FAILURE "
        exit 1
    else
        echo "The command is executed .......Success "

    fi

}

if [ $userid -ne 0 ]
then
    echo " Get the Root user Privilages "

    exit 1
fi

dnf install git -y 

validate $?

# if [ $? -ne 0 ]
# then
#     echo " git is not  installed, goint to install now... "
#     dnf install gitt -y 
#     if [ $? -ne 0 ]
#     then 
#         echo "git instation failure,please check "
#     fi
# else
#      echo " Git instalation is successsssss..."

# fi

# dnf install mysql -y 

# if [ $? -ne 0 ]
# then
#     echo " mysql is not  installed, goint to install now... "
#     dnf install mysql -y 
#     if [ $? -ne 0 ]
#     then 
#         echo "mysql instation failure,please check "
#     fi
# else
#      echo " mysql instalation is successsssss..."

# fi