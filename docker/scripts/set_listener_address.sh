#!/bin/bash
perl -i'' -pe \
  "s/#(listeners=.*?):\/\/(.*?$)/\1:\/\/0.0.0.0\2/" \
  $KAFKA_HOME/config/server.properties
perl -i'' -pe \
  "s/#(advertised.listeners=.*?):\/\/.*?(:9092)/\1:\/\/broker\2/" \
  $KAFKA_HOME/config/server.properties
