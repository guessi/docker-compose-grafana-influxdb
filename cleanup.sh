#!/usr/bin/env bash

docker-compose down

docker volume rm demo_grafana-lib
docker volume rm demo_grafana-log
docker volume rm demo_influxdb-lib
