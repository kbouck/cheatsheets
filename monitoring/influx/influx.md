

# overview

```bash
# my take
- csv friendly. lots of native csv input/output. thats great for data that might also wind up in spreadsheets
- server has built-in gui and data-explorer
- accepts timestamps in data (frown towards prometheus)
- simple text wire format
- supported by grafana
- queries can return csv, I think (to verify). may be useful generating reports that go into spreadsheets

# TICK stack
- telegraf
- influxdb
- chronograf - real-time visualization
- kapacitor - monitoring and alerting



# InfluxDB
time series db


# telegraf
- data collector
- single binary
- plugin ecosystem
- no dependencies
[data sources] -> telegraf [inputs, processors/aggs, outputs] -> influxdb 


# flux
- query language?


```



# concepts

```markdown
# measurements
- container for tags, fields, and timestamps

# tags vs fields
- both store key-value metadata
- fields: for storing non-commonly-queried metadata (not-indxed)
- tags: for storing commonly-queried metadata (indexed)

# field set
- field key/value pairs associated with a timestamp

```



# line protocol

```bash
# syntax
<measurement>[,<tag_key>=<tag_value>[,<tag_key>=<tag_value>]] <field_key>=<field_value>[,<field_key>=<field_value>] [<timestamp>]

where:
- measurement (required)
- tag set (optional)
- field set (required)
- timestamp (optional, epoch nanoseconds)


# example
myMeasurement,tag1=value1,tag2=value2 fieldKey="fieldValue" 1556813561098000000
```



```

# import

```bash
# csv
influx write -b example-bucket -f path/to/example.csv


```



# influx cli

```bash
# install
brew install influx-cli    # => /usr/local/bin/influx

# authenticate
influx config create --config-name <config-name> \
  --host-url http://localhost:8086 \
  --org <your-org> \
  --token <your-auth-token> \
  --active

```



# utility example
```bash
influx write dryrun --bucket utilities -f /tmp/utility-metrics-2021-10-influx.csv --org dorknet \
--header "#constant measurement,usage" \
--header "#dataType ignore,dateTime:RFC3339,ignore,tag,double,double,double" \
--http-debug --compression none --debug

# csv columns:
readingdate,readingtime,readinghour,utility,quantity,cost,price

# if annotation header sufficient
influx write --bucket utilities --org dorknet -f utility-metrics-2022-04.csv 


gas,year=xxx,month=xxx,day=xxx,tariff=xxx used=xxx,cost=64.23 1577836800000000000
electric,year=xxx,month=xxx,day=xxx,tarrif=xxx used=xxx,cost=64.23 1577836800000000000
```





# telegraf

```bash
# generate sample config
telegraf -sample-config -input-filter file -output-filter influxdb_v2

# test
telegraf --config telegraf.conf --test   # output line protocol

```



# flux

```bash
from(bucket: "bucket-name")
    |> range(start: 2019-08-17T00:00:00Z, stop: 2019-08-19T00:00:00Z)
    |> filter(fn: (r) => r._field == "bees" and r._value == 23)
    
    
    
    
from(bucket: "utilities")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "usage")
  |> filter(fn: (r) => r["_field"] == "cost" or r["_field"] == "quantity")
  |> aggregateWindow(every: v.windowPeriod, fn: sum, createEmpty: false)
  |> yield(name: "sum")
  
  
  
  
  
```

