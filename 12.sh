#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

VALIDATE(){
    if  [ $1 -ne 0]
        echo "$2...Failure"
        exit 1
    else
        echo "$2 ....Success" 
    fi       
}

if  [ $USERID -ne 0]
then
    echo "please run this script with root access"
    exit 1
else
    echo " You are super user"
fi

dnf install mysql -y &>>$LOGFILE

VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"
