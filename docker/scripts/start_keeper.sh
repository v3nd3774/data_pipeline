#!/bin/bash
echo "zookeeper-server-start.sh -daemon $KAFKA_HOME/config/zookeeper.properties"
zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties
