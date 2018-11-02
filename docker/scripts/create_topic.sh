#!/bin/bash
echo "kafka-topics.sh --create --topic twitter --zookeeper zookeeper:2181 --partitions 1 --replication-factor 1"
kafka-topics.sh --create --topic twitter --zookeeper zookeeper:2181 --partitions 1 --replication-factor 1
