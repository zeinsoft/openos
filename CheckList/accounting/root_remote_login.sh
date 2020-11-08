count=$(cat /etc/securetty | grep " pts/"| wc -l)

# ptx/* 는 있으면 안됨
if [ $count -gt 0 ];
then
    exit 1
fi

exist=$(cat /etc/pam.d/login | grep "pam_securetty.so"|wc -l)

if [ $exist -gt 0 ];
then 
    remark=$(echo ${exist:0:1})
    if [ ${remark} == '#' ];
    then 
        # 설정은 있으나 comment 되어 있음
        exit 1
    else    
        exit 0
    fi
else
    # auth pam_securetty.so 설정이 없음
    exit 1
fi
