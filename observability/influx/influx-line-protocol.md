# syntax

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

## examples

```bash
myMeasurement,tag1=value1,tag2=value2 fieldKey="fieldValue" 1556813561098000000

# utility
utility,utility=gas quantity=1,cost=2,unit_price=2.5
utility,utility=electric quantity=3,cost=4,unit_price=3

# weather
weather,location=Amsterdam temp=1.1,humidity=89.1 1678226400000000000

```

# annotated csv

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

## datatype

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
number               # ns: epoch nanoseconds:  1577836800000000000  --precision
                     # ms: epoch milliseconds: 1577836800000
                     # s:  epoch seconds:      1577836800
2006-01-02           # YYYY-MM-DD:             2020-01-01
```

## group / default

```bash
group           # indicates whether the column is part of the group key
default         # value to use for rows with an empty value

#group,true,true,false
#default
```

## examples

```yaml
#constant measurement,weather
#datatype ignore,dateTime:number,tag,double,double
time,time_epoch,location,temperature,humidity
2023-03-01T00:00:00+0100,1677625200,Amsterdam,-0.1,93.0
2023-03-01T01:00:00+0100,1677628800,Amsterdam,-1.2,94.0

#constant measurement,hvac
#datatype ignore,dateTime:number,ignore,tag,double,double,boolean,long,long
time,time_epoch,device_id,device_name,room_temp,set_temp,power_mode,energy_mode,energy_used
2023-03-01T00:00:02+0000,1677628802,37481268,Bedroom,15.0,22.0,False,1,1265200

#constant measurement,dns
#datatype ignore,dateTime:number,tag,long
time,time_epoch,dns,response
2023-03-01T01:00:01+01:00,1677628801,1.1.1.1,15

#constant measurement,ping
#datatype ignore,dateTime:number,tag,double,double,double,double,double
time,time_epoch,host,avg,best,worst,stddev,lost_pct
2023-03-01T01:00:36+0100,1677628836,192.168.1.2,0.71,0.64,0.86,0.06,0.00
```



logs

```bash
Tags
- appname ()
- facility
- host
- hostname
- severity (needs to match the syslog severity level keyword to display properly in Chronograf)

                       keyword:
  - 0	Emergency      emerg
  - 1	Alert          alert
  - 2	Critical       crit
  - 3	Error          err
  - 4	Warning        warning
  - 5	Notice         notice
  - 6	Informational  info
  - 7	Debug          debug

Fields:
- facility_code (integer)
- message (string)
- procid (string)
- severity_code (integer)
- timestamp (integer)
- version (integer)
```

