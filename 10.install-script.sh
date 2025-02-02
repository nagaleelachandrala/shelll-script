#!/bin/bash

USERID=$(id -u)

VALIDATE(){

if [ $? - ne 0]
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

   VALIDATE $? "Installing MYSQL"

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

    VALIDATE $? "Installing git"
    
else
     echo "git is already installed"
fi     