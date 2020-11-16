#!/bin/bash

SERVICE_NAME=tftp

service_exist=$(dpkg -l | grep $SERVICE_NAME | wc -l)

if [ $service_exist -gt 0 ];
then
	if [ $forceApply ];
	then
		apt-get purge tftp -y
		service_exist=$(dpkg -l | grep $SERVICE_NAME | wc -l)
		if [ ${service_exist} -gt 0 ]; 
		then
			exit 1
		fi
		exit 0
	fi
	exit 1
fi
exit 0