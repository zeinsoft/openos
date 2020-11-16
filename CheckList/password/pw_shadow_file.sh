#!/bin/bash

issue='NOT_EXIST'

if [ -f /etc/shadow ];
then
	issue='EXIST'
	cat /etc/passwd | while read line
	do
        psw=$(echo $line | cut -d':' -f2)        
		if [ $psw != "x" ];
		then
			issue='FORMAT_ERROR'
			break
		fi
	done
fi

if [ ${issue} == 'NOT_EXIST' ];
then	
	if [ $forceApply ];
	then
		pwconv
		if [ -f /etc/shadow ];
		then	
			exit 0
		else	
			exit 1
		fi
	else	
		exit 1
	fi
else
	exit 0
fi