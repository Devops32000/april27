#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$timestamp-$scriptname.log 

validate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...Failure"
    else
        echo "$2 success"
    fi 
}

if [ $userid -ne 0 ]
then 
    echo "Please run with sudo access"
else 
    echo "You are a super user"
fi 

dnf install mysql -y &>>$logfile
validate $? "Installation of mysql"

dnf install git -y &>>$logfile
validate $? "Installtion oif GIT"

