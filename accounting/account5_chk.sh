userlist=$(cat /etc/group | grep "netdev" | cut -d':' -f4 | tr "," "\n")
notroot="YES"
for username in ${userlist}
do
	if [ x${username} != "root" ];
	then
		notroot="NO"
	fi
done

if [ ${notroot} != "YES" ]; then
	echo "other user exist"
else
	echo "DONE"
fi
