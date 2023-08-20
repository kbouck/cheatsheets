


# install

```bash
# linux - apt
sudo apt install prometheus-node-exporter

# linux - tarball
mkdir <prometheus-dir>
cd <prometheus-dir>
wget https://github.com/prometheus/node_exporter/releases/download/v*/node_exporter-*.*-amd64.tar.gz
tar xvfz node_exporter-*.*-amd64.tar.gz


# macos - brew 
brew install node_exporter

```


# run
```bash
# apt 
/usr/bin/prometheus-node-exporter

# as service
todo


# using docker
todo

# macos - brew services
brew services start node_exporter

```



# ports

```
listens on :9100
```





# metrics - cpu

| Metric                                                       | Meaning                                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| rate(node_cpu_seconds_total{mode="system"}[1m\])             | The average amount of CPU time spent in system mode, per second, over the last minute (in seconds) |
| [`node_filesystem_avail_bytes`](http://localhost:9090/graph?g0.range_input=1h&g0.expr=node_filesystem_avail_bytes&g0.tab=1) | The filesystem space available to non-root users (in bytes)  |
| [`rate(node_network_receive_bytes_total[1m\])`](http://localhost:9090/graph?g0.range_input=1h&g0.expr=rate(node_network_receive_bytes_total[1m])&g0.tab=1) | The average network traffic received, per second, over the last minute (in bytes) |



# metrics - disk

| Metric                                                       | Meaning                                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| rate(node_cpu_seconds_total{mode="system"}[1m\])             | The average amount of CPU time spent in system mode, per second, over the last minute (in seconds) |
| [`node_filesystem_avail_bytes`](http://localhost:9090/graph?g0.range_input=1h&g0.expr=node_filesystem_avail_bytes&g0.tab=1) | The filesystem space available to non-root users (in bytes)  |
| [`rate(node_network_receive_bytes_total[1m\])`](http://localhost:9090/graph?g0.range_input=1h&g0.expr=rate(node_network_receive_bytes_total[1m])&g0.tab=1) | The average network traffic received, per second, over the last minute (in bytes) |

# metric - network

| Metric                                                       | Meaning                                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| rate(node_cpu_seconds_total{mode="system"}[1m\])             | The average amount of CPU time spent in system mode, per second, over the last minute (in seconds) |
| [`node_filesystem_avail_bytes`](http://localhost:9090/graph?g0.range_input=1h&g0.expr=node_filesystem_avail_bytes&g0.tab=1) | The filesystem space available to non-root users (in bytes)  |
| [`rate(node_network_receive_bytes_total[1m\])`](http://localhost:9090/graph?g0.range_input=1h&g0.expr=rate(node_network_receive_bytes_total[1m])&g0.tab=1) | The average network traffic received, per second, over the last minute (in bytes) |
