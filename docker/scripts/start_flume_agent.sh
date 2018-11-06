#!/bin/bash
echo ""
flume-ng agent -n $agent_name -c conf -f $FLUME_HOME/data_pipeline.config
/utilities/healthcheck.sh /utilities/flume_agent_alive.sh
if [ "$?" -eq 0 ];then
  tail -f /dev/null
else
  exit 1
fi
