#!/bin/bash
echo "perl -i'' -pe \"s/(zookeeper.connect=).*?(:.*?$)/\1zookeeper\2/\" $KAFKA_HOME/config/server.properties"
perl -i'' -pe "s/(zookeeper.connect=).*?(:.*?$)/\1zookeeper\2/" $KAFKA_HOME/config/server.properties
