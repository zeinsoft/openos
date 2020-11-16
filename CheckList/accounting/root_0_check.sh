#!/bin/bash

USER_ROOT='root'
UID_ROOT='0'

CHECK_USER='N'

while read oneline
do
    userid=$(echo $oneline | awk -F: '{print $1}')
    uid=$(echo $oneline | awk -F: '{print $3}')
    if [ $uid == $UID_ROOT ] && [ $userid != $USER_ROOT ];
    then
        CHECK_USER='Y'
        break;
    fi 

done < /etc/passwd

if [ $CHECK_USER == 'N' ];
then
    exit 0
else
    exit 1
fi