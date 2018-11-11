#!/bin/bash
$2 docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory . \
  exec $1 bash
