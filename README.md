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

#### [Misc] Where can I find my data?

after upgrading to Grafana 5.1+, data store changed, please find your data via `$ docker volume ls`

reference: [FAQ - Grafana Migration][faq-grafana-migration]

```bash
$ docker volume ls

$ docker volume inspect data-influxdb-lib
$ docker volume inspect data-grafana-lib
$ docker volume inspect data-grafana-log
```

### Docker Images

- [Grafana v5.2.2][docker-image-grafana]
- [InfluxDB 1.5.4][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
[faq-grafana-migration]: http://docs.grafana.org/installation/docker/#migration-from-a-previous-version-of-the-docker-container-to-5-1-or-later
