#!/bin/bash
v3_name="v3desktop"
alyac_name="alyac"

if [ $(systemctl is-active $v3_name) == "inactive" ] ||
	[ $(systemctl is-active $alyac_name) == "inactive" ]; then
	exit 1
else
	exit 0
fi



