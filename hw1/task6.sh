#!/usr/bin/env bash

find . -maxdepth 1 -user "$(whoami)" -name "*.txt" -printf "%f\0" | tr -dc "\0" | wc -m
