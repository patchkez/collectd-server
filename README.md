# Dockerized collectd daemon 

This is dockerized version of [collectd](https://collectd.org/) with multiple plugins for monitoring of Linux server.
You only need docker to run this (in privileged mode?), and grafana with data source (influxdb) for displaying graphs.
i
Enabled plugins:
- write_graphite
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
docker run -d -e HOST_NAME=$(hostname -s) -e GRAPHITE_HOST=<graphite host> \
  -e GRAPHITE_PORT=2003 \
  -v </etc/ceph/of/running/cluster>:/etc/ceph:ro \
  -v /etc/hosts:/etc/hosts:ro
  -e GRAPHITE_UPDATE_INTERVAL=30 -e GRAPHITE_PREFIX=collectd. \
  patchkez/collectd-server
```

Environment variables:

* `HOST_NAME` - hostname to use in graphite.
* `GRAPHITE_HOST` - host where carbon is listening for data.
* `GRAPHITE_PORT` - port where carbon is listening for data, `2003` by default.
* `GRAPHITE_UPDATE_INTERVAL` - metric update interval, `30` by default
* `GRAPHITE_PREFIX` - prefix for metrics in graphite, `collectd.` by default.

This image builds from `ceph/base` and has the same tags.
