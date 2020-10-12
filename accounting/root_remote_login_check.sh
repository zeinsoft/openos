count=$(cat /etc/securetty | grep "pts"| wc -l)
echo "result" $count

exist=$(cat /etc/pam.d/login | grep "/lib/security/pam_securetty.so"
