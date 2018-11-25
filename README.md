# Grafana Monitoring System with InfluxDB

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

#### [Grafana] How do I initialized my Grafana with InfluxDB?

1. Login via http://localhost:3000, use the default user/pass: admin/admin

```bash
$ docker exec -it demo_influxdb_1                                             \
    influx                                                                    \
      -username root                                                          \
      -password 5up3rS3cr3t                                                   \
      -execute 'CREATE DATABASE demo;'
```

2. Configure Data Source

```
[Data Source]
- Name: MyInfluxDataSource
- Type: InfluxDB

[HTTP]
- URL: http://demo_influxdb_1:8086
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

$ docker volume inspect data-influxdb-lib
$ docker volume inspect data-grafana-lib
$ docker volume inspect data-grafana-log
```

### Docker Images

- [Grafana v5.3.2][docker-image-grafana]
- [InfluxDB 1.7.1][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
[faq-grafana-migration]: http://docs.grafana.org/installation/docker/#migration-from-a-previous-version-of-the-docker-container-to-5-1-or-later
