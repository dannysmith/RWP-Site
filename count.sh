#!/bin/bash

wc_total=0

function cnt {
    cd $1
    for file in `ls`; do
	if [ -d $file ]; then
	    cnt $file
	else
	    if [ "`file $file | grep -i '\(ascii\|text\)'`" != "" ]; then
		let "wc_total += `cat $file | wc -l`"
	    fi
	fi
    done
    cd ..
}

cnt .
echo $wc_total
exit 0