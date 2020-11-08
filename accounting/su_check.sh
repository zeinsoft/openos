wheel_count=$(cat /etc/group | grep wheel | wc -l)
if [ $wheel_count -gt 0 ];
then
    exit 0
else
    exit 1
fi