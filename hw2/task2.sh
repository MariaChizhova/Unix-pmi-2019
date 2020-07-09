#!/usr/bin/env bash

while read -r line1
do
	d="$(echo "$line1" | awk -F/ '{ print $3}' | cut -d "@" -f2- | cut -d ":" -f1 |  sed -r 's/^.*www./www./1')"
	p="$(echo "$line1" | awk -F/ '{ print $1}' | sed 's/.$//')"
	flag=1
	while read -r line2
	do
		domain="$(echo "$line2" | awk '{print $1}')"
		protocol="$(echo "$line2" | awk '{print $2}')"
		if [[ "$d" == "$domain" && "$p" == "$protocol" ]]
			then
				flag=0
		fi
	done < "$1"
	if [[ "$flag" == 1 ]]
		then
		echo "ALLOW"
	else 
		echo "DENY"
	fi	
done
