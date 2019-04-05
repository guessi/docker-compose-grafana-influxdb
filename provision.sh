#!/usr/bin/env bash

set -o errexit
set -o nounset

source demo.env

echo "==> Prepare Configurations"
sed -e 's/%%INFLUXDB_ADMIN_USER%%/'${INFLUXDB_ADMIN_USER}'/g'         \
    -e 's/%%INFLUXDB_ADMIN_PASSWORD%%/'${INFLUXDB_ADMIN_PASSWORD}'/g' \
    -e 's/%%INFLUXDB_DEMO_DATABASE%%/'${INFLUXDB_DEMO_DATABASE}'/g'   \
    grafana/etc/provisioning/datasources/datasource.yaml.template     \
  > grafana/etc/provisioning/datasources/datasource.yaml

echo "==> Docker Image Pull"
docker-compose pull

echo "==> Bring Up Services"
docker-compose up -d

# FIXME: it's not a good idea to hard-code fixed value here
#        but... why not take a cup of coffee :-)
echo "==> Waiting for Services Ready"
sleep 60

echo "==> Initial Database"
docker exec -it influxdb                 \
  influx                                 \
    -username ${INFLUXDB_ADMIN_USER}     \
    -password ${INFLUXDB_ADMIN_PASSWORD} \
    -execute 'CREATE DATABASE '${INFLUXDB_DEMO_DATABASE}';'

echo "==> Done"

echo "==> Next Step:"
echo "    Setup your dashboard by visiting http://localhost:3000"
echo "==> Default Username: admin"
echo "==> Default Password: admin"
