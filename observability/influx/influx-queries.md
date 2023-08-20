

# Flux vs InfluxQL

- https://docs.influxdata.com/influxdb/cloud/reference/syntax/flux/flux-vs-influxql/#influxql-and-flux-parity

# Influx Vars

- consider moving these to grafana-... note

```bash
v.bucket                 # 

# vars
v.timeRangeStart         # time range start
v.timeRangeStop          # time range stop
v.windowPeriod           # current optimized window period
```



# Flux

- functional query language
- https://docs.influxdata.com/flux/v0.x/stdlib/universe/
- lots of standard library functions

## structure

```css
from(bucket: "home")
|> range(start: -1h)
|> filter(fn: (r) => r._measurement == "weather" and r._field == "temperature")
```



## from

```css
from(bucket: "home")
from(bucket: v.bucket)
```

## range

```css
range(start: 2019-08-17T00:00:00Z, stop: 2019-08-19T00:00:00Z)
range(start: v.timeRangeStart, stop:v.timeRangeStop)
range(start: -1h)
range(start: -12h)
range(start: -1y)
```

## filter

```css
filter(fn: (r) => r._measurement == "example-measurement")     # measurement name
filter(fn: (r) => r["_value"] >= 10 and r["_value"] <= 20)     # min/max value

filter(fn: (r) =>                                              # compound boolean
    r._measurement == "example-measurement" and
    r._field == "example-field"
  )
```

## map

```css
map(fn: (r) => ({r with _value: r._value * r._value}))
```

## aggregate

```css
aggregateWindow(every: v.windowPeriod, fn: mean|median|max|count|derivative|sum)
```

## combine multiple fields

- https://docs.influxdata.com/influxdb/cloud/query-data/common-queries/multiple-fields-in-calculations/

```css
// /* add system cpu + user cpu*/
from(bucket: "home")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "cpu")
  |> filter(fn: (r) => r["_field"] == "usage_system" or r["_field"] == "usage_user")
  |> filter(fn: (r) => r["cpu"] == "cpu-total")
  |> pivot(rowKey: ["_time"], columnKey: ["_field"], valueColumn: "_value")
  |> map(fn: (r) => ({ r with _value: r.usage_system + r.usage_user }))
  |> aggregateWindow(every: 1m, fn: max, createEmpty: false)
  |> yield(name: "max")
```







```bash
from(bucket: "home")
  |> range(start: v.timeRangeStart, stop:v.timeRangeStop)
  |> filter(fn: (r) =>
    r._measurement == "weather" and
    r._field == "temperature"
  )

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

## group+aggregate

```js
from(bucket:"example-bucket")
    |> range(start: -12h)
    |> filter(fn: (r) => r._measurement == "system" and r._field == "uptime" )
    |> group(columns:["host", "_value"])
    
// v.windowPeriod is a variable referring to the current optimized window period (currently: $interval)
from(bucket: v.bucket)
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "measurement1" or r["_measurement"] =~ /^.*?regex.*$/)
  |> filter(fn: (r) => r["_field"] == "field2" or r["_field"] =~ /^.*?regex.*$/)
  |> aggregateWindow(every: v.windowPeriod, fn: mean|median|max|count|derivative|sum)
  |> yield(name: "some-name")
```

## window

```css
from(bucket:"example-bucket")
    |> range(start:-1y)
    |> filter(fn: (r) => r._measurement == "mem" and r._field == "used_percent" )
    |> aggregateWindow(every: 1mo, fn: mean)
```

## join

```bash
dataStream1 = from(bucket: "example-bucket1")
    |> range(start: -1h)
    |> filter(fn: (r) => r._measurement == "network" and r._field == "bytes-transferred")

dataStream2 = from(bucket: "example-bucket2")
    |> range(start: -1h)
    |> filter(fn: (r) => r._measurement == "httpd" and r._field == "requests-per-sec")

join(tables: {d1: dataStream1, d2: dataStream2}, on: ["_time", "_stop", "_start", "host"])
```

## pivot

```bash
from(bucket: "example-bucket")
    |> range(start: -1h)
    |> filter(fn: (r) => r._measurement == "cpu" and r.cpu == "cpu-total")
    |> pivot(rowKey: ["_time"], columnKey: ["_field"], valueColumn: "_value")
```

## historgram

```css
from(bucket: "example-bucket")
    |> range(start: -1h)
    |> filter(fn: (r) => r._measurement == "mem" and r._field == "used_percent")
    |> histogram(buckets: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
```



# InfluxQL
