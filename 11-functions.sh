#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run this script with Root access"
    exit 1
else
    echo " You are super user"
fi        