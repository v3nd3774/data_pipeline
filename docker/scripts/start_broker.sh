#!/bin/bash
echo "server.properties:"
cat $KAFKA_HOME/config/server.properties
echo "kafka-server-start.sh $KAFKA_HOME/config/server.properties"
kafka-server-start.sh $KAFKA_HOME/config/server.properties
