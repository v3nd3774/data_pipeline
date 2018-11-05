#!/bin/bash
topics=`kafka-topics.sh --list --zookeeper zookeeper:2181`
num_twitter_topics=`echo "$topics" | grep twitter | wc -l`
if [ "$num_twitter_topics" -eq 1 ];then
  exit 0
else
  exit 1
fi
