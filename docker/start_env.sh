#!/bin/bash
docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory . \
  down
docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory . \
  up -d --build
