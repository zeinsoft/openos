count=$(cat /etc/passwd | grep -e ftp -e anonumous| wc -l)
if [ $count -gt 0 ];
then
    exit 1
else 
    exit 0