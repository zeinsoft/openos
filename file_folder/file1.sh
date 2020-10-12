# /etc/passwd
FILENAME="/etc/passwd"
FILENAME="./file1.sh"


function check_file() {
    local lfilename=$1
    local owner=$(stat -c "%U" ${lfilename})
    local result
    if [ $owner == "root" ];
    then
        local accessright=$(ls -al $lfilename | cut -d' ' -f1)

        if [ ${accessright:3:1} != '-' ] || [ ${accessright:5:1} != '-' ] || [ ${accessright:6:1} != '-' ] || [ ${accessright:8:1} != '-' ] || [ ${accessright:9:1} != '-' ]
        then
            result="모드 설정 이슈"
        else    
            result="OK"
        fi
    else
        result="ROOT가 아님"
    fi
    echo $result
}

check_file $FILENAME

