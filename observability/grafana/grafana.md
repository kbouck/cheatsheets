



queries

```bash




```



# global vars

- https://grafana.com/docs/grafana/latest/variables/variable-types/global-variables/
```bash

# from/to
${__from}               1594671549254              Unix millisecond epoch
${__from:date}          2020-07-13T20:19:09.254Z   No args, defaults to ISO 8601/RFC 3339
${__from:date:iso}      2020-07-13T20:19:09.254Z   ISO 8601/RFC 3339
${__from:date:seconds}  1594671549                 Unix seconds epoch
${__from:date:YYYY-MM}  2020-07	                   Any custom date format that does not include the : character


# time, interval
$__interval             # time formatted string: eg. 1d
$__interval_ms          # interval milliseconds
$__interval_ms/1000     # interval seconds
$__range             


$__timeFilter, $timeFilter


# data links
from=<epoch-ms>
to=<epoch-ms>
time=1500000000000
time.window=10000


```



# sqlite plugin

```bash
# not sure if these are introduced by sqlite plugin, or are global
$__unixEpochGroupSeconds(unixEpochColumnName, intervalInSeconds)
# Example: $__unixEpochGroupSeconds("time", 10)
# Will be replaced by an expression usable in GROUP BY clause. For example:
# cast(("time" / 10) as int) * 10

$__unixEpochGroupSeconds(unixEpochColumnName, intervalInSeconds, NULL)



where time_epoch between ${__from}/1000 and ${__to}/1000  

```



