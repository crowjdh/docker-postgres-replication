#!/bin/bash

if [[ $# -lt 1 ]]; then
  echo "Usage: compose.sh [COMPOSE_CMD]"
  exit 1
fi

docker-compose -f docker-postgres-replication/docker-compose.yml -f docker-compose.yml $@
