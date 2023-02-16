

Many date and time functions can be performed with to_char(<timestamp>, <format-str>)
See: https://www.postgresqltutorial.com/postgresql-to_char/

# types

```sql
CREATE TABLE table-name {
    timestamp TIMESTAMP [p] [without time zone]    -- date and time
    timestamp TIMESTAMP [p] with time zone         -- date and time
    date DATE                                      -- date (no time)
    time TIME [p] [without time zone]              -- time of day (no date)
    time TIME [p] with time zone                   -- time of day (no date)
    interval INTERVAL [fields] [p]                 -- duration of time
}

-- where p is for the precision of fractional digits retained by seconds field
-- possivle values for p: [0-6]

-- possible values for interval fields:
-- YEAR
-- MONTH
-- DAY
-- HOUR
-- MINUTE
-- SECOND
-- YEAR TO MONTH
-- DAY TO HOUR
-- DAY TO MINUTE
-- DAY TO SECOND
-- HOUR TO MINUTE
-- HOUR TO SECOND
-- MINUTE TO SECOND

```

# functions

```sql
timestamp :: DATE                           -- timestamp to date
to_char(timestamp :: DATE, ‘yyyy-mm-dd’)    -- timestamp to date w/format

to_char(epoch FROM timestamp)               -- timestamp to epoch secs
SELECT TIMESTAMP WITH TIME ZONE 'epoch' + 982384720.12 * INTERVAL '1 second'; -- epoch secs to timestamp

to_char(timestamp, 'WW')                    -- timestamp to week of year (1..53)

extract(month FROM timestamp)               -- timestamp to hour of day (0..23)
to_char(timestamp, 'Month')                 -- timestamp to month of year text
to_char(timestamp, 'month')                 -- timestamp to month of year text (lowercased)
to_char(timestamp :: DATE, ‘yyyy-mm’)       -- timestamp to month of year text (formatted)  

extract(dow FROM timestamp)                 -- timestamp to day of week (0=sun, 6=sat)
extract(isodow FROM timestamp)              -- timestamp to day of week (1=mon, 7=sun)
to_char(timestamp, 'Day')                   -- timestamp to day of week text
to_char(timestamp, 'day')                   -- timestamp to day of week text (lowercased)

extract(hour FROM timestamp)                -- timestamp to hour of day (0..23)
to_char(timestamp, 'HH24')                  -- timestamp to hour of day (00..23)
to_char(timestamp, 'HH12')                  -- timestamp to hour of day (01..12)
to_char(timestamp, 'HH12am')                -- timestamp to hour of day (01am..12pm)

# postgres - date-time - where
WHERE reading_date >= '2021-11-01'
  AND reading_date <  '2022-02-01'
```

