#!/usr/bin/env sh

response=$(curl -s -o /dev/null -w "%{http_code}\n" http://10.203.46.34:3000/)
if [ "$response" != "200" ]
then
 exit 1
fi
