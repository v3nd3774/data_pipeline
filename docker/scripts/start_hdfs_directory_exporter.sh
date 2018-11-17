#!/bin/bash
/utilities/add_datanode_ip_to_hosts.sh
python /hdfs_directory_exporter/exporter.py /data > /web_server.log 2>&1 &
tail -f /web_server.log
