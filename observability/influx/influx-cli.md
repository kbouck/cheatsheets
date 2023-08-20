# influx cli

## install

```bash
# install (mac)
$ brew install influx-cli    # => /usr/local/bin/influx

sudo apt install influxdb-client

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

# authenticate (and make this config active)
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
$ influx write ...                     # write to influxdb
$ influx write dryrun ...              # write to stdout instead of influxdb

# format
- line protocol
- annotated csv

# notable options
-f, --file <file>                      # file to import
-c, --active-config <config-name>      # config to use (if not already active)
-b, --bucket                           # bucket to write to
    --format <lp|csv>                  # line protocol, or csv (default: lp)
    --header <text>                    # prepend csv header line
    --precision <s|ms|ns>              # timestamp precision (s, ms, ns. default: ns)

# interactive
$ influx

# write csv (no annotations)
influx write -b <bucket> --format csv -f file.csv

# write csv (with annotations)
influx write -b <bucket> --format csv -f annotations.csv -f file.csv

# set epoch timestamp precision
influx write --precision s             # seconds
influx write --precision ms            # milliseconds
influx write --precision ns            # nanoseconds


influx write --bucket home --precision s --format csv -f dns-header.csv -f dns-metrics_2023-03.csv
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

