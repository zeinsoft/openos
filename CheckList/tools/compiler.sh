#!/bin/bash
check_compiler=$(which gcc | wc -l)

if [ ${check_compiler} -gt 0 ]; then
	if [ $forceApply ];
	then
		apt-get remove --auto-remove gcc -y
		check_compiler=$(which gcc | wc -l)
		if [ ${check_compiler} -gt 0 ]; 
		then
			exit 1
		fi
		exit 0
	fi
	exit 1
fi
exit 0


