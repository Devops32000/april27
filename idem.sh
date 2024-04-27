#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "please run with sudo previliges"
else
    echo "You are a super user"

echo "hi ra macha"

