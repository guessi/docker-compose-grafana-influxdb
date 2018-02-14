# Grafana + InfluxDB Monitoring System

### Prerequisites

- Docker-CE 17.06+
- Docker Compose v1.18.0+

### Usage

    $ docker-compose pull

    $ docker-compose up

    $ firefox http://localhost:3000

### FAQ

#### Why is that influxDB datasource doesn't work?

manual create database is still required

```bash
$ docker exec -it demo_influxdb_1                                             \
    influx                                                                    \
      -version

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

- [Grafana v4.6.3][docker-image-grafana]
- [InfluxDB 1.3.8][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
