#!bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/temp/$SCRIPTNAME-$TIMESTAMP.log

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "$2.....Failure"
    exit 1
else
    echo "$2....Success"
fi
}
if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1
else
    echo "You are super USER"
fi

dnf install mysql -y
VALIDATE $? "Installing mysql"
      

dnf install git -y

VALIDATE $? "Installing mysql"