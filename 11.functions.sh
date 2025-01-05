#!/bin/bash

USERID=$(id -u)

VALIDATE(){

  if [ $1 - ne 0]
   then
       echo "$2 ..FAILURE"
        exit 1
   else 
     echo "$2 ..SUCESS"    
   fi   
}

if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must hv sudo access to run the script "
    exit 1
fi

dnf list installed mysql

if [ $? - ne 0]
   then

     dnf install mysql -y
     VALIDATE $? " installing MYSQL"
else
     echo "MYSQL is already .....INSTALLED" 
   fi   

 dnf list installed git

if [ $? - ne 0]
then

    dnf install git -y 

     VALIDATE $? " installing git"
    
    
    else
     echo "git is already installed"
fi     