#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$timestamp-$scriptname.log 
R="\e[31m"
G="\e[32m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...$R Failure $N"
        exit 1
    else
        echo "$2...$G success $N"
    fi 
}

if [ $userid -ne 0 ]
then 
    echo "Please run with sudo access"
    exit 1
else 
    echo "You are a super user"
fi 

dnf install mysql -y &>>$logfile
validate $? "Installation of mysql"

dnf install git -y &>>$logfile
validate $? "Installtion oif GIT"

