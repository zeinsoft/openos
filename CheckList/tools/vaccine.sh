#!/bin/bash
servicename="v3desktop"
if [ $(systemctl is-active $servicename) == "inactive" ]; then
	exit 1
else
	exit 0
fi



