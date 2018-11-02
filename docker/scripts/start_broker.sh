#!/bin/bash
echo "STARTING ZOOKEEPER"
echo "zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties"
zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties
echo "kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties"
kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties
echo "DONE"
tail -f /dev/null
