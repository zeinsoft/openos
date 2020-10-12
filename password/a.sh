targetline_exist="N"
commentline_exist="N"
wrong_format="N"
setline_exist="N"

cat /etc/login.defs | while read oneline
do
    passminlen=$(echo $oneline | grep PASS_MIN_LEN | expand -1 | sed -e 's/^ *//g' | tr -s ' ')

    length=$(echo ${passminlen} | wc -L)    
    if [ ${length} -gt 0 ]; then
	    echo ${passminlen}

        remark=$(echo ${passminlen:0:1})
        if [ ${remark} == '#' ];
        then
	        commentline_exist="Y"
            echo "1"
        else
            minlen=$(echo ${passminlen}" " | cut -d ' ' -f2)

            length=$(echo ${minlen} | wc -L)
            if [ ${length} -eq 0 ]; then
                wrong_format="NOT_SET"
            echo "2"
                break
            fi

            r=${minlen//[0-9]/}
            if [ -z "${r}" ]; then
                if [ ${minlen} -lt 8 ]; then
                    wrong_format="TOO_SHORT"
                    echo "1wrong_format="${wrong_format}
                    break
                else
                    setline_exist="YES"
                    echo "YES"
                    break
                fi
            else
                wrong_format="NOT_DIGIT"
                echo "4"
                break
            fi

        fi
    fi
done

echo "1wrong_format="${wrong_format}
#echo "targetline_exist="${targetline_exist}
#echo "commentline_exist="${commentline_exist}
#echo "wrong_format="${wrong_format}
#echo "setline_exist="${setline_exist}