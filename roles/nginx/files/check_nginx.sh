#!/usr/bin/env bash

# Simple check to see if NGINX is running
if pgrep -x "nginx" > /dev/null
then
    exit 0   # NGINX is running, exit with success
else
    exit 1   # NGINX is not running, exit with failure
fi
