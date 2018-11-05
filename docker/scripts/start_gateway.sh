#!/bin/bash
echo "checking brokers are up..."
/utilities/healthcheck.sh /utilities/brokers_alive.sh
if [ "$?" -eq 0 ];then
  echo "brokers are up..."
else
  echo "brokers are down..."
  exit 1
fi
/utilities/create_topic.sh
/utilities/healthcheck.sh /utilities/twitter_topic_exist.sh
echo "checking topic is up"
if [ "$?" -eq 0 ];then
  echo "topic is up"
  tail -f /dev/null
else
  echo "topic is down"
  exit 1
fi
tail -f /dev/null
