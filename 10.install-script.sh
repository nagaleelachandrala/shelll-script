#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must hv sudo access to run the script "
    exit 1
fi

dnf list installed mysql

if [ $? - ne 0]
then

   dnf install mysql -y

   if [ $? - ne 0]
   then
       echo "installing MYSQL..FAILURE"
        exit 1
   else 
     echo "installing MYSQL..SUCESS"    
   fi
else
      echo "MYSQL is already installed"
   fi   

 dnf list installed git

if [ $? - ne 0]
then

    dnf install git -y 

    if [ $? - ne 0]
    then
        echo "installing GIT..FAILURE"
        exit 1
    else 
        echo "installing GIT..SUCESS"    
    fi
else
     echo "git is already installed"
fi     