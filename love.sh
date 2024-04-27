#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$timestamp-$scriptname.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2...$R Failed $N"
        exit 11
    else
        echo -e "$2...$G Success $N"
    fi 
}

if [ $userid -ne 0 ]
then 
    echo "Please run with sudo access"
else
    echo "You are a super user"
fi 

for i in $@
do 
    echo "package to install $i"
    dnf list installed $i &>>$logfile
    if [ $? -eq 0 ]
    then
        echo -e "$i already installed, hence...$Y SKipping $N"
    else
        dnf install $i -y &>>$logfile
        validate $? "installing $i"
    fi 
done 

