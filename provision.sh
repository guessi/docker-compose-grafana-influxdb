#!/usr/bin/env bash

set -o errexit
set -o nounset

source influx2.env

echo "==> Prepare Configurations"
sed -e 's/%%INFLUXDB_INIT_ORG%%/'${DOCKER_INFLUXDB_INIT_ORG}'/g' \
    -e 's/%%INFLUXDB_INIT_BUCKET%%/'${DOCKER_INFLUXDB_INIT_BUCKET}'/g' \
    -e 's/%%INFLUXDB_INIT_ADMIN_TOKEN%%/'${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN}'/g' \
    grafana/etc/provisioning/datasources/datasource.yaml.template \
  > grafana/etc/provisioning/datasources/datasource.yaml

echo "==> Docker Image Pull"
docker compose pull

echo "==> Bring Up Services"
docker compose up -d
