#!/bin/bash
prometheus --config.file $PROMETHEUS_HOME/prometheus_config.yml
#/utilities/healthcheck.sh /utilities/twitter_topic_exist.sh
#if [ "$?" -eq 0 ];then
#  echo "all good"
#  tail -f /dev/null
#else
#  echo ":("
#  exit 1
#fi
