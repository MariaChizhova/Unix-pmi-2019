#!/usr/bin/env bash

< "ip.txt" xargs -n1 ping -c5 >> res.txt 2>> err.txt
