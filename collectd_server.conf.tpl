Hostname "{{ HOST_NAME }}"

FQDNLookup false
## Interval 10
Interval "{{ COLLECTD_UPDATE_INTERVAL | default("30") }}"
Timeout 2
ReadThreads 5

LoadPlugin network
LoadPlugin conntrack
LoadPlugin cpu
LoadPlugin cpufreq
LoadPlugin df
LoadPlugin disk
LoadPlugin hddtemp
LoadPlugin ipmi
LoadPlugin smart
LoadPlugin interface
LoadPlugin load
LoadPlugin memory
LoadPlugin processes
LoadPlugin swap
LoadPlugin tcpconns
LoadPlugin uptime
LoadPlugin users
LoadPlugin virt

## CollectD Servers
<Plugin "network">
   Server "{{ COLLECTD_HOST }}" "{{ COLLECTD_PORT | default("25826") }}"
   SecurityLevel None
</Plugin>

<Plugin tcpconns>
   LocalPort "22"
</Plugin>
