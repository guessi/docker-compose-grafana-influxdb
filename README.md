# Grafana + InfluxDB Monitoring System

### Prerequisites

- Docker-CE 17.12+
- Docker Compose v1.21.0+

### Usage

    $ docker-compose pull

    $ docker-compose up

    $ open http://localhost:3000

### FAQ

#### [InfluxDB] How do I check running InfluxDB's version?

```bash
$ docker exec -it demo_influxdb_1                                             \
    influx                                                                    \
      -version
```

#### [Grafana] Why is InfluxDB datasource doesn't work?

manual create database is still required

```bash
$ docker exec -it demo_influxdb_1                                             \
    influx                                                                    \
      -username root                                                          \
      -password 5up3rS3cr3t                                                   \
      -execute 'CREATE DATABASE demo;'

$ docker exec -it demo_influxdb_1                                             \
    influx                                                                    \
      -username root                                                          \
      -password 5up3rS3cr3t                                                   \
      -execute 'SHOW DATABASES;'
```


### Docker Images

- [Grafana v5.1.2][docker-image-grafana]
- [InfluxDB 1.5.2][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
