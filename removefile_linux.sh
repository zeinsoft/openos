#!/bin/bash

FILENAME='/tmp/issue.msg'

if [ -f $FILENAME ];
then
    if [ $forceApply  ]; then
	    rm $FILENAME
        if [ -f $FILENAME ];
        then
            echo "ERROR : FILE EXIST"
            exit 1

        else
            echo "FILE CLEAR"
            exit 0
        fi
    else
        echo "FILE EXIST"
        exit 1
    fi
else
    echo "NO FILE"
	exit 0
fi