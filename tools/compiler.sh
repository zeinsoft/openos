check_compiler=$(which gcc | wc -l)

if [ ${check_compiler} -gt 0 ]; then
	echo "compiler exist"
else
	echo "compiler NOT exit"
fi