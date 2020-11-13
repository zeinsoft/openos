issue='NOT_EXIST'

if [ -f /etc/shadow ];
then
	cat /etc/passwd | while read line
	do
        psw=$(echo $line | cut -d':' -f2)        
		if [ $psw != "x" ];
		then
			issue='FORMAT_ERROR'
			break
		fi
	done
else
	issue='NO_FILE'
fi

if [ $issue == 'NOT_EXIST' ];
then	
	exit 0
elif [  $issue == 'NOT_EXIST' ];
then	
	pwconv
	if [ -f /etc/shadow ];
	then	
		exit 0
	else	
		exit 1
	fi
elif [ $issue == 'FORMAT_ERROR' ];
then
	exit 1
fi