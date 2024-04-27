#!/bin/bash

userid=$(id -u)
timestamp=$(date +%F-%H-%M-%S)
scriptname=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$timestamp-$scriptname.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

valiate(){
    if [ $1 -ne 0 ]
    then 
        echo "$2...$R Failed $N"
        exit 11
    else
        echo "$2...$G Success $N"
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
    dnf list installed &>>$logfile
    if [ $? -eq 0 ]
    then
        echo "$i already installed, hence...$Y SKipping $N"
    else
        dnf install $i &>>$logfile
        validate $? "installing $i"
    fi 
done 

