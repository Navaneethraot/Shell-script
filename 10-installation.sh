#!/bin/bash
USERID=$(id -u)

if [$USERID -ne 0]
then 
    echo "please run this script with root user"
    exit 1
 else
        echo "you are super user"
 fi
     dnf install mysql -y

    if [ $? -ne 0 ]
     then 
       echo "Installation of mysql...FAILURE"
       exit 1
      else
        echo "Installation of mysql...SUCCESS"
      fi
     dnf install git -y
     if if [ $? -ne 0 ]
     then
        echo "  Installation of mysql...FAILURE"
        exit 1
     else
        echo    "Installation of mysql...SUCCESS"             
      fi
