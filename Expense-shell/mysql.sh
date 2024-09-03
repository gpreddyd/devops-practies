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

dnf install mysql-server -y &>>$log_file
validate $? "Install mysql server"


systemctl enable mysqld &>>$log_file
validate $? "enable mysql server"

systemctl start mysqld &>>$log_file
validate $? "start mysql server"

# hydenpotency  start 

mysql -h mysql.gpdevops.online -u root -pExpenseApp@1 -e 'show databases' &>>$log_file
if [ $1 -ne 0 ]
then
    echo "The root password is not setup,...setting up now"
    mysql_secure_installation --set-root-pass ExpenseApp@1
else

    echo  -e " the roor password alredy setup, $Y skipping now $N "

fi

# end Hydenpotency 
