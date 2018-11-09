#!/bin/bash
echo "zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties"
zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties
/utilities/healthcheck.sh /utilities/zookeeper_alive.sh
if [ "$?" -eq 0 ];then
  tail -f $KAFKA_HOME/logs/zookeeper.out
else
  exit 1
fi
tail -f /dev/null
