#!/bin/bash

USER_FTP='ftp'
USER_ANONYMOUS='anonymous'

count=$(cat /etc/passwd | grep -e $USER_FTP -e $USER_ANONYMOUS | wc -l)
if [ $count -gt 0 ];
then
    if [ $forceApply ]; 
    then
        deluser $USER_FTP
        deluser $USER_ANONYMOUS

        count=$(cat /etc/passwd | grep -e $USER_FTP -e $USER_ANONYMOUS | wc -l)
        if [ $count -gt 0 ];
        then
            exit 1
        else    
            exit 0
        fi
    else
        exit 1
    fi
else 
    exit 0
fi