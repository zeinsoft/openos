#!/bin/bash
SERVICE_NAME=autofs

service_exist=$(dpkg -l | grep $SERVICE_NAME | wc -l)

if [ $service_exist -gt 0 ];
then
	if [ $forceApply ];
	then
		apt-get purge autofs -y
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
