fileexist=$(ls -alL /etc/xinetd.d/* | egrep "echo -finger"  | wc -l)

if [ $fileexist -gt 0 ];
then
	str_disable=$(cat /etc/xinetd.d/echo-finger | egrep "disable|Disable")
	count_disable=$(echo $str_disable | wc -l)
	if [ $disableexist -gt > 0 ];
	then
		str_disable=$(echo $str_disable | sed -e 's/^ *//g')
		if [ ${str_disable:0:1} == '#' ];
		then
			echo "REMARK"
		fi
	fi
else
	echo "NOT USE"
fi