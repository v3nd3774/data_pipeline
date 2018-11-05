#!/bin/bash
echo "Checking health of host $(hostname)."
is_healthy=1
for try in $(seq 1 3);do
  sleep 10
  echo "Attempt #$try, using script: $1"
  sh -c $1
  if [ "$?" -eq 0 ];then
    is_healthy=0
    break
  fi
done
exit $is_healthy
