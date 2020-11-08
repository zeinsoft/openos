if [ -f /etc/shadow ];
then
	cat /etc/passwd | while read line
	do
        psw=$(echo $line | cut -d':' -f2)        
		if [ $psw != "x" ];
		then
			echo "password not excap"
			break
		fi
	done
else
	echo "NO SHADOW FILE"
fi