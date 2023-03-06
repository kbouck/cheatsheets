# telegraf

```bash
# generate sample config
telegraf -sample-config -input-filter file -output-filter influxdb_v2

# test
telegraf --config telegraf.conf --test   # output line protocol
```

