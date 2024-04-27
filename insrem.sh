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
        echo -e "$2...$R Failed $N"
        exit 1
    else
        echo -e "$2...$G Success $N"
    fi 
}

if [ userid -ne 0 ]
then 
    echo "please run with sudo access"
    exit 13
else
    echo "You are a super user"
fi 

dnf remove mysql -y &>>$logfile
validate $? "Removing mysql"

dnf remove git -y &>>$logfile
validate $? "Removing git"




