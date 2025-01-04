#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR :: you must hv sudo access to run the script "
fi

dnf install mysqll -y