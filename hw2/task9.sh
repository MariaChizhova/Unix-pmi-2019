#!/usr/bin/env bash

parallel -a "$1" -lk  curl -s https://ipvigilante.com/{} | sed -e 's/[{}]"/''/g' | sed 's/\"//g' | awk -v RS=',' -F: '$1=="city_name"{print $2}' 