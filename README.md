# Grafana Monitoring System with InfluxDB

### Disclaimer

This is demonstration scripts for running Grafana with InfluxDB as datasource.

**Please be sure to check all the env files before running this setup on Production environment.**

### Prerequisites

- Docker Engine 20.10+

### Quick Start Guide

```bash
./provision.sh
```

That's all, now you should be able to check your dashboard by visiting http://localhost:3000 :-)

### FAQ

#### I just messed up, how do I start over again?

```bash
./cleanup.sh
```

### Docker Images

- [Grafana v9.0.3][docker-image-grafana]
- [InfluxDB 2.2.0][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
[faq-grafana-migration]: http://docs.grafana.org/installation/docker/#migration-from-a-previous-version-of-the-docker-container-to-5-1-or-later

### License

- [InfluxDB - MIT][license-influxdb]
- [Grafana - Apache License 2.0][license-grafana]

[license-influxdb]: https://github.com/influxdata/influxdb/blob/master/LICENSE
[license-grafana]: https://github.com/grafana/grafana/blob/master/LICENSE
