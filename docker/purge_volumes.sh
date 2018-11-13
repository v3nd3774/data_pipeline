#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
$DIR/stop_env.sh
for v in `docker volume ls | awk '{print $2}'`;do
  docker volume rm -f $v
done
