

# overview

```markdown
- csv friendly. lots of native csv input/output. thats great for data that might also wind up in spreadsheets
- server has built-in gui and data-explorer
- accepts timestamps in data (frown towards prometheus)
- simple text wire format
- supported by grafana
- queries can return csv

# TICK stack
- telegraf
- influxdb
- chronograf - real-time visualization
- kapacitor - monitoring and alerting

# influxdb
- time series db

# telegraf
- data collector
- single binary
- plugin ecosystem
- no dependencies
[data sources] -> telegraf [inputs, processors/aggs, outputs] -> influxdb 

# flux
- query language

# influx-cli
- todo
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

## syntax

```markdown
<measurement>[,<tag_key>=<tag_value>[,<tag_key>=<tag_value>]] <field_key>=<field_value>[,<field_key>=<field_value>] [<timestamp>]

where:
- measurement (required)  name of measurement (string)
- tag set     (optional)  comma-separated tags (strings)
- field set   (required)  comma-separated key=value pairs. keys are strings, values can be float, int, string, or boolean
- timestamp   (optional)  epoch nanoseconds (eg. 1465839830100400200)

field value types:
  - 5  (float is default)
  - 5i ('i' suffix casts to int)
  - <text> (string)
  - t, T, true, True TRUE     (boolean)
  - f, F, false, False, FALSE (boolean)

# special chars
- escape with \.
- escapable chars are: , = <space> "

# keywords


# duplicates
- if point already exists (same measurement name, tag set, and timestamp), new point is merged, with later taking precedence in case of field value conflicts 

# cli
# same as line protocol, just prefixed with 'INSERT '
INSERT weather,location=us-midwest temperature=82 1465839830100400200
```

## example

```bash
myMeasurement,tag1=value1,tag2=value2 fieldKey="fieldValue" 1556813561098000000
```

# influx cli

## install

```bash
# install (mac)
$ brew install influx-cli    # => /usr/local/bin/influx

# install - linux - arm64
$ wget https://dl.influxdata.com/influxdb/releases/influxdb2-client-2.6.1-linux-amd64.tar.gz
$ tar xvzf path/to/influxdb2-client-2.6.1-linux-amd64.tar.gz
$ sudo cp influxdb2-client-2.6.1-linux-amd64/influx /usr/local/bin/
```

## config

- https://docs.influxdata.com/influxdb/v2.6/reference/cli/influx/config/create/
- https://docs.influxdata.com/influxdb/v2.6/reference/cli/influx/config/list/
- https://docs.influxdata.com/influxdb/v2.6/reference/cli/influx/config/rm/
- https://docs.influxdata.com/influxdb/v2.6/reference/cli/influx/config/set/

```bash
$ influx config create ...
$ influx config list ...               # 
$ influx config rm ...                 # aliases: rm, remove, delete
$ influx config set ...

# authenticate
$ influx config create -n <config-name> -u http://localhost:8086 -o <org> -t <auth-token> -a   # api token
$ influx config create -n <config-name> -u http://localhost:8086 -o <org> -p <user:pass> -a    # <user>:<pass>

# notable options
-n, --config-name                      # name of new config
-u, --host-url                         #
-o, --org                              #
-t, --token                            #
-p, --username-password                #
-a, --active                           # set specified connection to be the active config
-h, --help                             #
    --debug                            #
```

## write

- https://docs.influxdata.com/influxdb/v2.6/reference/cli/influx/write/

```bash
$ influx write ...                     # write to influx db
$ influx write dryrun ...              # write to stdout (and not to influxdb)

# format
- line protocol
- annotated csv

# notable options
-f, --file                             # file to import
-c, --active-config                    # config to use
-b, --bucket                           #
    --format                           # lp or csv (default: lp)
    --header                           # prepend csv header line
    --precision                        # timestamp precision (s, ms, ns. default: ns)

# interactive - stdin
$ influx

# file - csv
influx write -b example-bucket -f path/to/example.csv
```

## annotated csv

- https://docs.influxdata.com/influxdb/v2.6/reference/syntax/annotated-csv/

```csv
field value types are determined by CSV annotations

_measurement, _field, _value


```

```bash
#group,false,false,false,false,true,true
#datatype,string,long,dateTime:RFC3339,double,string,string
#default,_result,,,,,
,result,table,_time,_value,_field,_measurement
,,0,2020-12-18T18:16:11Z,72.7,temp,sensorData
,,0,2020-12-18T18:16:21Z,73.8,temp,sensorData
```

### datatype

```bash
datatype             # maps csv column index to line protocol element (measurement, tag, field+type, timestamp) 

# examples:
#datatype,<col1-datatype>,<col2-datatype>,...
#datatype,string,long,dateTime:RFC3339,double,string,string

# column datatypes:
measurement          # column is measurement name
tag                  # column is a tag name
dateTime[:format]    # column is timestamp (eg. dateTime:RFC3339)
time[:format]        # "" (alias for dateTime)
field                # column is a field (auto type)
string               # column is a field (string)
double               # column is a field (float/double)
long                 # column is a field (int/long)
unsignedLong         # column is a field (unsigned int/long)
boolean              # column is a field (boolean)
ignore               # column shall be ignored
ignored	             # column shall be ignored

# dateTime formats
RFC3339              # RFC3339:                2020-01-01T00:00:00Z
RFC3339Nano          # RFC3339 nanoseconds:    2020-01-01T00:00:00.000000000Z
number               # ns: epoch nanoseconds:  1577836800000000000
                     # ms: epoch milliseconds: 1577836800000
                     # s:  epoch seconds:      1577836800
2006-01-02           # YYYY-MM-DD:             2020-01-01
```

### group / default

```bash
group           # indicates whether the column is part of the group key
default         # value to use for rows with an empty value

#group,true,true,false
#default
```



# influx UI

```bash
http://localhost:8086 
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
