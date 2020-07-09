#!/usr/bin/env bash

num=$(shuf -i 0-65536 -n1)
head -c "$num" < /dev/urandom > rnd.txt
