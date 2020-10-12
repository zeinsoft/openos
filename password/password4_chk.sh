shadowfile=$(ls /etc/shadow | wc -l)
echo "##"$shadowfile"##"

if [ $shadowfile -eq 1 ];
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