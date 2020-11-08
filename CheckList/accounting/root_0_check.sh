list_count=$(cat /etc/passwd | grep ":0:" | cut -d':' -f1|wc -l)
root_count=$(cat /etc/passwd | grep ":0:" | cut -d':' -f1|grep 'root' |wc -l)
if [ ${list_count} -gt ${root_count} ]; 
then
    exit 1
else
    exit 0
fi