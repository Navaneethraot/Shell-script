#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$($0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

echo "Scrippt started running at : $TIMESTAMP"

VALIDATE(){
    if  [ $1 -ne 0 ]
    then
        echo -e "$2 ....$R Failure $N"  
        exit 1
    else
        echo -e "$2 .....$G Success $N"
    fi              
}

if  [ $USERID -ne 0 ]
    then
        echo "Please run this script with root access"
        exit 1
    else
        echo "you are super user"
    fi    

    for i in $@
    do
        echo  "Package to install : $i"
        dnf list installed $i &>>$LOGFILE
        if [ $? -eq 0 ]
        then 
            echo -e "$i already installed $Y Skipping $N"
        else
           dnf install $i -y &>>$LOGFILE
           VALIDATE $? Installation of $i 
        fi
   done        