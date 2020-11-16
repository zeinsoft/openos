#!/bin/bash

targetline_exist="N"
commentline_exist="N"
wrong_format="N"
setline_exist="N"

GREP_WORD='PASS_MAX_DAYS'

while read oneline
do
    passminlen=$(echo $oneline | grep $GREP_WORD | expand -1 | sed -e 's/^ *//g' | tr -s ' ')

    length=$(echo ${passminlen} | wc -L)    
    if [ ${length} -gt 0 ]; then

		remark=$(echo ${passminlen:0:1})
		if [ ${remark} == '#' ];
		then
	        commentline_exist="Y"
		else
			minlen=$(echo ${passminlen}" " | cut -d ' ' -f2)

			length=$(echo ${minlen} | wc -L)
			if [ ${length} -lt 1 ]; then
                wrong_format="NOT_SET"
                break
			fi

			r=${minlen//[0-9]/}
			if [ -z "${r}" ]; then
				if [ ${minlen} -gt 90  ]; then
                    wrong_format="TOO_MANY"
                    break
				else
                    targetline_exist="YES"
                    break
                fi
			else
                wrong_format="NOT_DIGIT"
                break
			fi
		fi
	fi
done < /etc/login.defs

if [ ${targetline_exist} == 'YES' ];
then
	exit 0
fi
exit 1
