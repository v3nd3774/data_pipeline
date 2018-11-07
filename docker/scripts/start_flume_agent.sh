#!/bin/bash
echo "Running: flume-ng agent -n $agent_name -c conf -f $FLUME_HOME/data_pipeline.config"
flume-ng agent -n $agent_name -c conf -f $FLUME_HOME/data_pipeline.config \
  >> /flume_agent.log 2>&1 &
/utilities/healthcheck.sh /utilities/flume_agent_alive.sh
if [ "$?" -eq 0 ];then
  /utilities/add_datanode_ip_to_hosts.sh
  tail -f /flume_agent.log
else
  exit 1
fi
