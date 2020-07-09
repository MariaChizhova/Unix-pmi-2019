#!/usr/bin/env bash

sed '/\/\*/,/\*\//d' file.c | sed 's/["<>]//g' | awk '/^[[:blank:]]*#include/' | sed 's/#include//g' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's/.h$//' | sed 's/.hpp$//'