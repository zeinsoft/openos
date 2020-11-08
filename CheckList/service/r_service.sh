DIR_NAME="/etc/xinetd.d"

if [ -d DIR_NAME ];
then	
	rcount=$(ls -alL DIR_NAME | egrep "rsh|rlogin|rexec" | egrep -v "grep|klogin|kshell|kexec")
	if [ $rcount -gt 1 ];
	then
		exit 1
	else	
		exit 0
	fi
else
	exit 0
fi
