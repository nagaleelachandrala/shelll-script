#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m]"


LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$( date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMEATAMP.log"
VALIDATE(){     

  if [ $1 -ne 0 ]
   then
       echo -e "$2 .. $R FAILURE $N"
        exit 1
   else 
     echo -e "$2 ..$G SUCESS $N"    
   fi   
}
echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE
if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must hv sudo access to run the script "
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then

     dnf install mysql -y &>>$LOG_FILE
     VALIDATE $? " installing MYSQL"
else
     echo -e "MYSQL is already .....$Y INSTALLED $N" 
   fi   

 dnf list installed git &>>$LOG_FILE

if [ $? -ne 0 ]
then

    dnf install git -y 

 VALIDATE $? " installing git"
    
    
    else
     echo -e  "git is already $Y installed $N"
fi     