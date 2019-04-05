#!/usr/bin/env bash

set -o errexit
set -o nounset

INFLUXDB_ROOT_USERNAME="root"
INFLUXDB_ROOT_PASSWORD="5up3rS3cr3t" # supersecret
INFLUXDB_DEMO_DATABASE="demo"

echo "==> Docker Image Pull"
docker-compose pull

echo "==> Bring Up Services"
docker-compose up -d

# FIXME: it's not a good idea to hard-code fixed value here
#        but... why not take a cup of coffee :-)
echo "==> Waiting for Services Ready"
sleep 60

echo "==> Initial Database"
docker exec -it influxdb                \
  influx                                \
    -username ${INFLUXDB_ROOT_USERNAME} \
    -password ${INFLUXDB_ROOT_PASSWORD} \
    -execute 'CREATE DATABASE '${INFLUXDB_DEMO_DATABASE}';'

echo "==> Done"

echo "==> Next Step: Setup your dashboard by visiting http://localhost:3000"
