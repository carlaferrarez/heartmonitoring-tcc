#!/bin/bash

cd /var/www/html 2>&1
OUTPUT="$(sudo gpio -x mcp3004:100:0 aread 100)"
#OUTPUT2=$(firebase database:get /sensor)"
#IFS=
#read -ra ADDR <<< "$OUTPUT2"
#echo ${OUTPUT2}"
#echo ${ADDR[1]}"

#OUTPUT=${ADDR[1]}"

TIME="$(date +%s)"
rrdtool update teste.rrd "$TIME":"$OUTPUT" > teste.log
let "TIME2 = TIME - 60"
let "TIME3 = TIME - 300"
let "TIME4 = TIME - 3600"
let "TIME5 = TIME - 86400"


sudo rrdtool graph teste.png \--start "$TIME2" --end "$TIME" \--step=4 \DEF:free_memory=teste.rrd:memory:AVERAGE \LINE2:free_memory#FF0000 \--vertical-label 'Pulso' \--title 'Last Minute' \--zoom 1.5 \--x-grid SECOND:1:SECOND:4:SECOND:10:0:%X 2>&1
sudo rrdtool graph teste2.png \--start "$TIME3" --end "$TIME" \--step=4 \DEF:free_memory=teste.rrd:memory:AVERAGE \LINE2:free_memory#FF0000 \--vertical-label 'Pulso' \--title 'Last 5 Minutes' \--zoom 1.5 \--x-grid SECOND:1:SECOND:4:SECOND:60:0:%X 2>&1
sudo rrdtool graph teste3.png \--start "$TIME4" --end "$TIME" \--step=4 \DEF:free_memory=teste.rrd:memory:AVERAGE \LINE2:free_memory#FF0000 \--vertical-label 'Pulso' \--title 'Last Hour' \--zoom 1.5 \--x-grid HOUR:1:MINUTE:10:MINUTE:20:0:%X 2>&1
sudo rrdtool graph teste4.png \--start "$TIME5" --end "$TIME" \--step=4 \DEF:free_memory=teste.rrd:memory:AVERAGE \LINE2:free_memory#FF0000 \--vertical-label 'Pulso' \--title 'Last Day' \--zoom 1.5 \--x-grid DAY:1:HOUR:6:HOUR:6:0:%X 2>&1
