#!/bin/bash

USERID=$(id -u)

if  [ $USERID  -ne 0 ]
then
    echo "please run this script with root access"
    exit 1
else
    echo " your are Super User"
fi

dnf install mysql -y

if  [ $? -ne 0 ]
then
    echo "Installation of mysql..... Failure"
    exit 1
 else
    echo "Installation of mysql .... Success"
fi       