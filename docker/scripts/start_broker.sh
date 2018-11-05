#!/bin/bash
echo "server.properties:"
cat $KAFKA_HOME/config/server.properties
echo "kafka-server-start.sh $KAFKA_HOME/config/server.properties"
kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties
/utilities/healthcheck.sh /utilities/brokers_alive.sh
if [ "$?" -eq 0 ];then
  tail -f $KAFKA_HOME/logs/kafkaServer.out
else
  exit 1
fi
