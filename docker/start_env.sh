#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
$DIR/stop_env.sh
docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory . \
  up -d --build
