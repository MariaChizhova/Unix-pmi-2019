#!/usr/bin/env bash

head -c "$(wc -c < data.txt)" data.txt | tee -a data.txt >/dev/null
