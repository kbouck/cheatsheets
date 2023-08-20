# telegraf

```bash
# generate sample config
telegraf -sample-config -input-filter file -output-filter influxdb_v2

# test
telegraf --config telegraf.conf --test   # output line protocol
```



# config

- sample: telegraf --sample-config --input-filter cpu:mem --output-filter influxdb_v2

```bash
# usually stored in /etc/telegraf/telegraf.conf

# global
[global_tags]
# <tag-key>=<tag-value>   # will tag all metrics

# agent
[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "10s"
  flush_jitter = "0s"
  precision = ""
  hostname = ""                      # override default hostname (if os.Hostname())
  omit_hostname = false

# outputs
[[outputs.influxdb_v2]]
  urls = ["http://127.0.0.1:8086"]
  token = ""
  organization = ""
  bucket = ""

# inputs
[[inputs.cpu]]
  percpu = true
  totalcpu = true
  collect_cpu_time = false
  report_active = false

[[inputs.mem]]
```

