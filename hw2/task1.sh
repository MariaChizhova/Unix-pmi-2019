#!/usr/bin/env bash

grep -Ps "^[A-Z][0-9a-zA-Z]*[ ]+([a-z]|m_)[0-9a-zA-Z]*\_{0,1};$" <<< "$1"