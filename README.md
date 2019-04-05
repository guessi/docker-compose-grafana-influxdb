# Grafana Monitoring System with InfluxDB

### Prerequisites

- Docker-CE 18.06+
- Docker Compose v1.23.1+

### Usage

    $ docker-compose pull

    $ docker-compose up

    $ open http://localhost:3000

### FAQ

#### [InfluxDB] How do I check running InfluxDB's version?

```bash
$ docker exec -it influxdb influx -version
```

#### [Grafana] How do I initialized my Grafana with InfluxDB?

1. Login via http://localhost:3000, use the default user/pass: admin/admin

```bash
$ docker exec -it influxdb             \
    influx                             \
      -username root                   \
      -password 5up3rS3cr3t            \
      -execute 'CREATE DATABASE demo;'
```

2. Configure Data Source

```
[Data Source]
- Name: MyInfluxDataSource
- Type: InfluxDB

[HTTP]
- URL: http://influxdb:8086
- Access: Server (Default)

[Auth]
- With Credentials (checked)
- other (unchecked)

[InfluxDB]
- Database: demo
- User: root
- Password: 5up3rS3cr3t
```

3. Update Settings

Now, click "Save & Test", and now you should be able to see message prompt: `Data source is working`


#### [Misc] Where can I find my data?

after upgrading to Grafana 5.1+, data store changed, please find your data via `$ docker volume ls`

reference: [FAQ - Grafana Migration][faq-grafana-migration]

```bash
$ docker volume ls

DRIVER          VOLUME NAME
local           demo_grafana-lib
local           demo_grafana-log
local           demo_influxdb-lib
```

### Docker Images

- [Grafana v6.1.0][docker-image-grafana]
- [InfluxDB 1.7.5][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
[faq-grafana-migration]: http://docs.grafana.org/installation/docker/#migration-from-a-previous-version-of-the-docker-container-to-5-1-or-later

### License

- [InfluxDB - MIT][license-influxdb]
- [Grafana - Apache License 2.0][license-grafana]

[license-influxdb]: https://github.com/influxdata/influxdb/blob/master/LICENSE
[license-grafana]: https://github.com/grafana/grafana/blob/master/LICENSE
