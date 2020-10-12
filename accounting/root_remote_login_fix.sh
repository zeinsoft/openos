FILENAME="/etc/securetty"
count=$(cat ${FILENAME} | grep "pts/x" | wc -l)
if [ ${count} -ge 0 ]; then
echo "L" $RANDOM	
echo $FILENAME+ $RANDOM + ";;"
	cp ${FILENAME} ${FILENAME}+$RANDOM
	echo "EX"
else
	echo "NOTHING"
fi


