#!/bin/bash

echo "all variables passed: $@"

echo "number of variables: $#"

echo "script name0: $0"

echo "present working directory: $PWD"

echo "home directory of current user: $HOME"

echo "which user is running this script: $USER"

echo "process id of cueerent script: $$"

sleep 60 &


echo "process id of current id in background :$!"