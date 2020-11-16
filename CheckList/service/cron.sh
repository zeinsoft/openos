#!/bin/bash
FILE_ALLOW="/etc/cron.allow"
FILE_DENY="/etc/cron.deny"
FILE_MOD_SET="-rw-r--r--"
FILE_MOD=644


function check_file() {
    local lfilename=$1
    local result

    if ! [ -f $lfilename ];
    then
        return 3
    fi

    local owner=$(stat -c "%U" ${lfilename})
 
    if [ $owner == "root" ];
    then
        local accessright=$(ls -al $lfilename | cut -d' ' -f1)

        if [ $accessright != FILE_MOD_SET ]
        then
            # 파일 모드 설정이 잘못 되었음
            return 2
        else    
            # 정상 설정
            return 0
        fi
    else
        # 소유자가 ROOT가 아님
        return 1
    fi
}

check_file $FILE_ALLOW
check_allow=$?

check_file $FILE_DENY
check_deny=$?

if [ check_allow -ne 0 ] || [ check_deny -ne 0 ];
then
    if [ $forceApply  ]; then
        chmod FILE_MOD $FILE_ALLOW
        chown root $FILE_ALLOW
        chmod FILE_MOD $FILE_DENY
        chown root $FILE_DENY

        check_file $FILE_ALLOW
        check_allow=$?
        check_file $FILE_DENY
        check_deny=$?

        if [ check_allow -ne 0 ] || [ check_deny -ne 0 ];
        then
            exit 1
        else
            exit 0
        fi
    else
        exit 1
    fi
else    
    exit 0
fi
