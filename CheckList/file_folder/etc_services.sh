# /etc/passwd
FILENAME="/etc/services"
FILE_MOD_SET="-rw-r--r--"
FILE_MOD=644

# return value
# 0 : 정상 설절
# 1 : 소유자가 ROOT가 아님
# 2 : 파일 모드 설정이 잘못 되었음 644 이어야 함.

function check_file() {
    local lfilename=$1
    local owner=$(stat -c "%U" ${lfilename})
    local result

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


if ! [ -f $FILENAME ];
then
    exit 0
fi

check_file $FILENAME
returnValue=$?

echo $returnValue

if [ $returnValue -ne 0 && $forceApply  ]; then
    chmod FILE_MOD $FILENAME
    chown root $FILENAME
fi
