#!/bin/bash
brokers=`zookeeper-shell.sh zookeeper:2181 <<< "ls /brokers/ids"`
num_brokers=`echo "$brokers" | perl -ne "print if s/.*?\[(\d*?)\].*?$/\1/" | wc -l`
if [ "$num_brokers" -ne 1 ];then
  exit 1
else
  exit 0
fi
