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
