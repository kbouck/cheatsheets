# syntax

```sql
SELECT   <expression(s)>
FROM     <table(s)>
JOIN     <to other table> ON <join condition>
WHERE    <predicate(s)>                         -- predicate applied before aggregation
GROUP BY <expression(s)>
HAVING   <predicate(s)>                         -- predicate applied to aggregation results
ORDER BY <expression(s)>
LIMIT    <number of rows>
```



# join

```bash

# inner join - return subset of rows from left and right that both match
  L   L+R   R
┌────┬───┬────┐
│    │XXX│    │
│    │XXX│    │
└────┴───┴────┘


# left outer join - return all rows from left joined with any matching rows from right
  L   L+R   R
┌────┬───┬────┐
│XXXX│XXX│    │
│XXXX│   │    │
│XXXX│XXX│    │
|XXXX
└────┴───┴────┘


# right outer join - return all rows from right joined with any matching rows from left
  L   L+R   R
┌────┬───┬────┐
│    │XXX│XXXX│
│    │   │XXXX│
│    │XXX│XXXX│
│    │   │XXXX│
└────┴───┴────┘


# full join - return all rows from left and right join when matching
  L   L+R   R
┌────┬───┬────┐
│XXXX│XXX│XXXX│
│XXXX│XXX│XXXX│
└────┴───┴────┘


# examples

```



# WHERE

```sql
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);


SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);
```



# subqueries

## scalar subquery

- returns a single value, or exactly one row and exactly one column

```sql
SELECT name AS painting,
     price,
     (SELECT AVG(price)
  FROM paintings) AS avg_price
FROM paintings;
```



## multiple-row subquery

- subquery returns more than one row
- includes:
  - subqueries that return one column with multiple rows (i.e. a list of values)
  - subqueries that return multiple columns with multiple rows (i.e. tables)
- subqueries that return one column and multiple rows are often included in the WHERE clause to filter the results of the main query
  - usually used with operators like IN, NOT IN, ANY, ALL, EXISTS, or NOT EXISTS

```sql
SELECT AVG(agency_fee)
FROM sales_agents
WHERE id NOT IN (SELECT id
                 FROM managers);
```



## correlated subquery

- https://en.wikipedia.org/wiki/Correlated_subquery
- nested query that uses values from the outer query
- subquery may be evaluated once for each row processed by the outer query, so can be slow.
- subqueries in the FROM clause cannot be correlated subqueries
- in some cases you can use JOIN instead of a subquery and get the same result (JOINs can perform faster than subqueries)

```sql
-- these subqueries are "correlated subqueries"
-- https://en.wikipedia.org/wiki/Correlated_subquery

SELECT
    w.startDate,
    REPLACE(w.startDate, '+', '%2B') AS date_url_enc,
    w.startDateSec*1000 AS startDateMs,
    (w.endDateSec+120)*1000 AS endDateMs,
    w.duration,
    w.totalDistance AS distance,
    w.totalEneryBurned as calories,
    w.duration/w.totalDistance AS pace,    (select AVG(r.value) from record r where r.type="HKQuantityTypeIdentifierHeartRate" AND r.startDateSec BETWEEN w.startDateSec AND w.endDateSec) AS hr_avg,
    (select AVG(r.value) from record r where r.type="HKQuantityTypeIdentifierHeartRate" AND r.startDateSec BETWEEN w.startDateSec AND w.endDateSec) AS hr_avg,
    (select 10*(10-(w.duration/w.totalDistance))/(10-6.5) * 10*(200-AVG(r.value))/(200-160) from record r where r.type="HKQuantityTypeIdentifierHeartRate" AND r.startDateSec BETWEEN w.startDateSec AND w.endDateSec) AS fitness,
    (select MAX(r.value) from record r where r.type="HKQuantityTypeIdentifierHeartRate" AND r.startDateSec BETWEEN w.startDateSec AND w.endDateSec) AS hr_max,
    (select MAX(r.value)-MIN(r.value) from record r where r.type="HKQuantityTypeIdentifierHeartRate" AND r.startDateSec BETWEEN w.endDateSec AND w.endDateSec+60) AS hrr_1m,
    (select MAX(r.value)-MIN(r.value) from record r where r.type="HKQuantityTypeIdentifierHeartRate" AND r.startDateSec BETWEEN w.endDateSec AND w.endDateSec+120) AS hrr_2m
    FROM workout w 
WHERE w.workoutActivityType="HKWorkoutActivityTypeRunning"
ORDER BY 1 desc
```

# CTE

- common table expression
- can be more readable than subqueries

```sql
WITH ... AS ()


WITH ... AS (...), WITH ... AS (...)       -- multiple CTEs
```



## recursive CTE

DAG graph traversal

```sql
-- schema
CREATE TABLE IF NOT EXISTS nodes (
    name TEXT,
    id   TEXT   NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS id_idx ON nodes(id);

CREATE TABLE IF NOT EXISTS edges (
    source     TEXT,
    target     TEXT,
    relation   TEXT,
    UNIQUE(source, target, relation) ON CONFLICT REPLACE,
    FOREIGN KEY(source) REFERENCES nodes(id),
    FOREIGN KEY(target) REFERENCES nodes(id)
);
CREATE INDEX IF NOT EXISTS source_idx ON edges(source);
CREATE INDEX IF NOT EXISTS target_idx ON edges(target);
```



```sql
-- inbound edges / ancestors
WITH RECURSIVE traversal(id) AS (
   SELECT '${node}'
   UNION
   SELECT source FROM edges JOIN traversal ON target=id
)
SELECT id FROM traversal
WHERE  id != "${node}";


-- outbound edges / descendents
WITH RECURSIVE traversal(id) AS (
   SELECT '${node}'
   UNION
   SELECT target FROM edges JOIN traversal ON source=id
)
SELECT id FROM traversal
WHERE  id != "${node}";


-- inbound and outbound edges / both ancestors and descendents
WITH RECURSIVE traversal(id) AS (
   SELECT '${node}'
   UNION
   SELECT source FROM edges JOIN traversal ON target=id
   UNION
   SELECT target FROM edges JOIN traversal ON source=id
)
SELECT id FROM traversal;
```







https://www.timescale.com/blog/content/images/2022/05/recursive-query-syntax-timescale-1.png


```sql
WITH RECURSIVE table_name AS (

    initial_query   -- Base result set to run against recursive query

    UNION [ALL]     -- Concatenates results of initial query and recursive queries

    recursive_query -- Runs against base result set and then against the result from this query recursively

                    -- Runs against the concatenated results from above

)
final_query
```



grafana query

```sql
SELECT 
  $__timeGroup(atimestamp,'5m') as time_sec,
  avg(afloat) as value, 
  avarchar as metric 
FROM mytable 
GROUP BY 1, avarchar 
ORDER BY 1
```



# reference

- todo: lots of sql resources / references mentioned here:
  https://news.ycombinator.com/item?id=30610532
- SQL Cookbook: https://downloads.yugabyte.com/marketing-assets/O-Reilly-SQL-Cookbook-2nd-Edition-Final.pdf
