#!/bin/bash
ports_listening=`netstat -tulpn | grep 2181 | grep LISTEN | wc -l`
if [ "$ports_listening" -eq 1 ];then
  exit 0
else
  exit 1
fi
