check_compiler=$(which gcc | wc -l)

if [ ${check_compiler} -gt 0 ]; then
	exit 1
else
	exit 0
fi