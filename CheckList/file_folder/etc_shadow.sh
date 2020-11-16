#!/bin/bash

FILENAME="/etc/shadow"
FILE_MOD_SET="-r--------"
FILE_MOD=400

function check_file() {
    local lfilename=$1
    local owner=$(stat -c "%U" ${lfilename})
    local result

    if [ $owner == "root" ];
    then
        local accessright=$(ls -al $lfilename | cut -d' ' -f1)
        if [ $accessright != $FILE_MOD_SET ]
        then             # 파일 모드 설정이 잘못 되었음
            return 2
        else            # 정상 설정
            return 0
        fi
    else                # 소유자가 ROOT가 아님
        return 1
    fi
}


if ! [ -f $FILENAME ];
then
    exit 0
fi

check_file $FILENAME
if [ $? -eq 0 ];
then
    exit 0
else
    if [ $forceApply  ]; then
        chmod $FILE_MOD $FILENAME
        chown root $FILENAME
        check_file $FILENAME
        returnValue=$?
        if [ $? -eq 0 ];
        then    
            exit 0
        fi
    fi
fi
exit 1