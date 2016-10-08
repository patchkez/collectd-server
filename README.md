# Dockerized collectd daemon 

This is dockerized version of [collectd](https://collectd.org/) with multiple plugins for monitoring of Linux server.
You only need docker to run this (in privileged mode?), and grafana with data source (influxdb) for displaying graphs.
i
Enabled plugins:
- network
- conntrack
- cpu
- cpufreq
- df
- disk
- hddtemp
- ipmi
- smart
- interface
- load
- memory
- processes
- swap
- tcpconns
- uptime
- users
- virt



## Running

```
docker run -d -e HOST_NAME=$(hostname -s) -e COLLECTD_HOST=<collectd server> \
  -e COLLECTD_PORT=25826 \
  -v /etc/hosts:/etc/hosts:ro \
  -e COLLECTD_UPDATE_INTERVAL=30 \
  patchkez/collectd-server
```

Environment variables:

* `HOST_NAME` - hostname to use in grafana.
* `COLLECTD_HOST` - host where collectd server is listening for data.
* `COLLECTD_PORT` - port where collectd server is listening for data, `25826` by default.
* `COLLECTD_UPDATE_INTERVAL` - metric update interval, `30` by default

This image builds from `ceph/base` and has the same tags.
