#!bin/bash

USERID=$(id -u)
if [$USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1
else
    echo "You are super USER"
fi

dnf install mysql -y

if [$? -ne 0 ]
then
    echo "Installation of mysql .....Failure"
    exit 1
else
    echo "Installation of mysql .....Success"
fi        

dnf install git -y

if [$? -ne 0 ]
then
    echo "Installation of git .....Failure"
    exit 1
else
    echo "Installation of git .....Success"
fi   