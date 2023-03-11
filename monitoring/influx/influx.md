



# overview

```markdown
- csv friendly. lots of native csv input/output. thats great for data that might also wind up in spreadsheets
- server has built-in gui and data-explorer
- accepts timestamps in data (frown towards prometheus)
- simple text wire format
- supported by grafana
- queries can return csv

# overview
[data sources] -> telegraf (ins/procs/aggs/outs) -> influxdb 
[data files]   -> influx cli                     -> influxdb 

# influxdb
- time series db
- includes chronograf, kapacitor as of v2

# telegraf
- data collector agent
- single binary 
- plugin ecosystem
- no dependencies

# influx-cli
- import line protocol
- import csv

# flux
- query language

# InfluxQL
- query language

# "TICK" stack
- telegraf
- influxdb
- chronograf (included with influxdb 2.x)
- kapacitor (action)
```

# concepts

```markdown
# measurements
- named container for tags, fields, and timestamps

# tags vs fields
- both store key-value metadata
- tags: indexed. so use for metadata used in query predicates, groups, etc.
- fields: non-indexed. so use for metrics, values

# field set
- field key/value pairs associated with a timestamp
```



# influx UI

```bash
http://localhost:8086 
```

# ports

```bash
8086                                  # HTTP API
```

# filesystem

```bash
/var/lib/influxdb/engine/             # time-series data
/var/lib/influxdb/influxd.bolt        # key-value data
~/.influxdbv2/configs                 # influx cli config
```

