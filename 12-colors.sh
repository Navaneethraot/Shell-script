#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$( date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script started executing at : $TIMESTAMP"

VALIDATE(){
    if [ $1 -ne 0]
    then 
        echo -e "$2 ...$R Failure $N"
        exit 1
    else
        echo -e "$2 ....$G Success $N"
    fi         
}

if [ $USERID -ne 0]
then
    echo " Please run this script with Root access"
    exit 1
else
    echo " User are super user"
fi    

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"

dnf install Dockerr -y &>>$LOGFILE
VALIDATE $? "Installing Docker"
