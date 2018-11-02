#!/bin/bash
docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory docker \
  down
docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory docker \
  up -d --build
