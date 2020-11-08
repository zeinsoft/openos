# /etc/passwd
FILENAME="/etc/shadow"
FILE_MOD=400
FILE_MOD_SET="-r--------"

# return value
# 0 : 정상 설절
# 1 : 소유자가 ROOT가 아님
# 2 : 파일 모드 설정이 잘못 되었음 400 이어야 함.

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

check_file $FILENAME
echo $?

if [ $forceApply  ]; then
    chmod FILE_MOD $FILENAME
    chown root $FILENAME
fi
