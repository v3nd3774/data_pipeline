#!/bin/bash
docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory . \
  down
for v in `docker volume ls | awk '{print $2}'`;do
  docker volume rm -f $v
done
