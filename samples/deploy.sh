#!/bin/bash
docker stack deploy -c docker-postgres-replication/docker-compose.yml -c docker-compose.yml nextcloud
