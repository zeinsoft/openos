#!/bin/bash

FILENAME='/tmp/comvoy.conf'

if [ -f $FILENAME ];
then
    exit 0
else
    if [ $forceApply  ]; then
	    echo “Comvoy Config” > $FILENAME
        if [ -f $FILENAME ];
        then
            exit 0

        else
            exit 1
        fi
    else
        exit 1
    fi
fi