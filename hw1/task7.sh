#!/usr/bin/env bash

find /etc -name "*.conf" -printf "%f\0"| sort -z | head -n10 -z | tr '\0' '\n'
