#!/usr/bin/env bash

PAR=$1

man -P cat "${@:2}" | sed -n -r "/$PAR/,/^[ \t]*[A-Z]+[A-Z ]*[ \t]*$/p" | head -n -2
