#!/bin/bash
# Variable declarations
echo "Setting Variables"
datanode_hostname="datanode1.hadoop"
datanode_service_name="datanode1"
# Get ip address of datanode1
echo "Getting IP addresses"
echo "Running:'ping -c 1 datanode1 | head -n 1'"
ping_reply=`ping -c 1 datanode1 | head -n 1`
echo "Running:'echo '$ping_reply' | perl -pe 's/.*?\((.*?)\).+/\1/'"
datanode_ip=`echo "$ping_reply" | perl -pe "s/.*?\((.*?)\).+/\1/"`
hosts_row="$datanode_ip  $datanode_hostname $datanode_service_name"
# Add entry to /etc/hosts
echo "$hosts_row" >> /etc/hosts
