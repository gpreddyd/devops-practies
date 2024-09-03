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

dnf install nginx -y &>>$log_file
validate $? "Install Nginix"

systemctl enable nginx &>>$log_file
validate $? "enable Nginix" 

systemctl start nginx &>>$log_file
validate $? "start Nginix "

rm -rf /usr/share/nginx/html/* &>>$log_file

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$log_file
validate $? "downloading front end code"

cd /usr/share/nginx/html 

unzip /tmp/frontend.zip &>>$log_file
validate $? "extract the frontend code"


cp   /home/ec2-user/devops-practies/Expense-shell/frontend.config   vim /etc/nginx/default.d/expense.conf &>>$log_file


systemctl restart nginx &>>$log_file
validate $1 " restart the Nginix "


