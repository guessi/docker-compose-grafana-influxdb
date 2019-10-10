# Grafana Monitoring System with InfluxDB

### Disclaimer

This is demonstration scripts for running Grafana with InfluxDB as datasource.
Please **DO NOT** use it in production.

### Prerequisites

- Docker-CE 18.06+
- Docker Compose v1.23.1+

### Quick Start Guide

```bash
$ ./provision.sh
```

That's all, now you should be able to check your dashboard by visiting http://localhost:3000 :-)

### FAQ

#### Where can I find my data?

please find your data via `$ docker volume ls`

```bash
$ docker volume ls

DRIVER          VOLUME NAME
local           demo_grafana-lib
local           demo_grafana-log
local           demo_influxdb-lib
```

#### I just messed up, how do I start over again?

I know you will ask, here's the cleanup script for you :-)

```bash
$ ./cleanup.sh
```

### Docker Images

- [Grafana v6.4.2][docker-image-grafana]
- [InfluxDB 1.7.8][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
[faq-grafana-migration]: http://docs.grafana.org/installation/docker/#migration-from-a-previous-version-of-the-docker-container-to-5-1-or-later

### License

- [InfluxDB - MIT][license-influxdb]
- [Grafana - Apache License 2.0][license-grafana]

[license-influxdb]: https://github.com/influxdata/influxdb/blob/master/LICENSE
[license-grafana]: https://github.com/grafana/grafana/blob/master/LICENSE
