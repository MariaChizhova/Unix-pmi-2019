#!/usr/bin/env bash

file=tmp.txt
for i in "$@"
do
    echo "$i" >> "$file"
done

LCS=""
LCSsize=""
read -r first_line< "$file"
for ((i=${#first_line}; i>0; i--)); do
    for ((j=0; j<i; j++)); do
    fstr=${first_line:j:i}
        fsize=${#fstr}
        if [[ $fsize -gt 5 ]]
        then
            {
            read -r;
            cnt=1
        all=0
        while read -r line; do
                all=$((all+1))
        for ((k = 0; k <= $((${#line}-fsize)); k++)); do
            if [[ $line = *${fstr}* ]]
            then
                cnt=$((cnt+1))
                break
            fi
        done
            done
        if [ $cnt -eq $all ]
        then
            LCS="$fstr"
            LCSsize=${#fstr}
            break
        fi
            } < "$file"
        fi
        done
done
while read -r line1; do
    if [[ ${line1:0:LCSsize} =~ $LCS ]]
    then 
        mv "$line1" "${line1//$LCS/}"
    else
        mv "$line1" "${line1//$LCS/ }"
    fi    
done < "$file"

rm tmp.txt