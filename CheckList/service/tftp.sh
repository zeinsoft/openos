SERVICE_NAME=tftp

service_exist=$(dpkg -l | grep $SERVICE_NAME | wc -l)

if [ $service_exist -ne 0 ];
then
	exit 1
else
	exit 0
fi