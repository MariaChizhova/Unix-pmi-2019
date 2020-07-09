#!/usr/bin/env bash

link="https://docs.google.com/spreadsheets/d/13n9n_cBvMO8kIjVaEPdrvi_iQ1kuoRAem4AIGcE1gM4/export?gid=0&format=csv"
prev_sum="$(curl -s "$link" | sed -n '/Чижова/p'| awk -F "\"*,\"*" '{print $4}')"

while true 
do
	sum="$(curl -s "$link" | sed -n '/Чижова/p'| awk -F "\"*,\"*" '{print $4}')"
	if [[ "$prev_sum" != "$sum" ]]
		then
			printf "RESULTS APPEARED\n"
			prev_sum=$sum
		#	notify-send --urgency=critical 'Новые баллы по алгоритмам'
		#	mpv 7.mp3
	fi	
	sleep 3
done
	
