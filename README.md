# Grafana + InfluxDB Monitoring System

### Prerequisites

- Docker Engine v1.12.6+
- Docker Compose v1.13.0+

### Usage

    $ docker-compose pull

    $ docker-compose up

    $ firefox http://localhost:3000

### FAQ

Why is that influxDB datasource doesn't work?

    manual create database is still required

    $ docker exec -it dockercomposegrafanainfluxdb_influxdb_1 influx
    Connected to http://localhost:8086 version 1.3.7
    InfluxDB shell version: 1.3.7
    > show databases
    name: databases
    name
    ----
    _internal
    >
    > create database influx
    >
    > show databases
    name: databases
    name
    ----
    _internal
    influx

### Docker Images

- [Grafana v4.6.1][docker-image-grafana]
- [InfluxDB 1.3.7][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
