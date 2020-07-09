#!/usr/bin/env bash

status=0
while true 
do
	wget -O file.html https://vk.com/mashachizhova  > /dev/null 2>&1
	is_online="$(sed -n '/<div class="profile_online_lv">/,$p' file.html | sed -r 's/^.{77}//' | head -c 6)"	

	if [[ "$is_online" ==  "online" && "$status" == 0 ]]
		then
			wall "Anton is online"
			status=1
	fi

	if [[ "$is_online" != "online" && "$status" == 1 ]]
		then
			wall "Anton is offline"
			status=0
	fi

done
