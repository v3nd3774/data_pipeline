#!/bin/bash
winpty docker-compose \
  -p data_pipeline \
  -f docker/docker-compose.yml \
  --project-directory docker \
  exec gateway bash
