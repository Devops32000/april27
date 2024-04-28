#!/bin/bash

source=/tmp/app-logs/

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $source ]
then 
    echo -e "$G source exists $N"
else
    echo -e "$R source doesn't exists $N"
    exit 1
fi 

files=$(find $source -name "*.log" -mtime +14)

while IFS=read -r line
do 
    echo -e "$Y deleting file: $line $N"
    rm -rf $line 
done <<< $files 


