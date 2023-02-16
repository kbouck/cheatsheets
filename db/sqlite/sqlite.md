# cheatsheet

```bash
# database
sqlite3 :memory:                   # use in-memory db instead of file
sqlite3 database.db                # open db (creating db file if non-existent)
sqlite3 database.db < create.sql   # execute sql file on db (creating db file if non-existent)
sqlite3 database.db -cmd '...'     # execute sql inline sql command

# ideas
csv-sql blah.csv < query.sql       # Create sqlite db in /tmp/ or somewhere (named by file's inode to reuse?) 
<csv-data> | csv-sql < query.sql

# tables and indexes
.tables                            # show tables
.schema table_name                 # show table schema
.indexes table_name                # show table indexes

# import data
.import <file> <table>             # import data file into table
.import --skip 1 <file> <table>    # "", skip n lines (eg. skip csv header line if table schema already exists)

# output display format
.headers [on|off]                  # include/exclude column header
.mode csv                          # csv
.mode tabs                         # tsv
.mode json                         # json array (not json-lines)
.mode column                       # column / pretty-print
.mode markdown                     # markdown
.mode table                        # ascii-art table
.mode box                          # box-drawing chars
.mode insert                       # SQL insert statements

# quit
.quit                              # quit REPL
Ctrl-D                             # quit REPL

# csv import
sqlite3 csv.db -csv -cmd '.import <csv-file> <table>'        # use csv headers as table columns
sqlite3 csv.db -csv -cmd '.import --skip 1 <file> <table>'   # skip 1 line (header row), csv column order must match schema
sqlite3 :memory: -csv -cmd '.import data.csv data' \
  'select * from from data'                                  # import+query one-liner
```

# indexes

```sqlite
-- create index
-- note: column order matters - supposedly should match query order (really?)
CREATE INDEX idx_record_type ON record(type);
CREATE INDEX idx_record_startdatesec_type ON record(startDateSec, type);
CREATE INDEX idx_record_type_startdatesec ON record(type, startDateSec);
CREATE INDEX idx_workout_type on workout(workoutActivityType);
CREATE INDEX idx_workout_startdatesec_type ON workout(startDateSec, workoutActivityType);
CREATE INDEX idx_workout_startdatesec_type ON workout(workoutActivityType, startDateSec);

-- list all indexes
.indexes
PRAGMA index_list("<table-name>")

-- show an index
.indexes <table-name>
PRAGMA index_info("<index-name>")


-- explain query
-- to confirm whether index is used appropriately
-- response contains info indicating if/how index is used
EXPLAIN QUERY PLAN 
<query>


-- index recommendations (expert mode)
> .expert
> <sql-query>;
-- output is a suggested index creation command that supports the query
```



# data types

```bash
# main types
NULL                # null
INTEGER             # signed integer
REAL                # floating point
TEXT                # text string
BLOB                # blob of binary

# binary
0                   # false
1                   # true

# date/time
TEXT                # ISO8601 strings ("YYYY-MM-DD HH:MM:SS.SSS")
INTEGER             # epoch time

```

# functions

```sql

floor(...)                               # might not exist
CAST(tsecs/1800 AS INTEGER)              # equivalent to floor
```




# csv

todo: 
  - csv virtual table: https://www.sqlite.org/csv.html

import:

- NOTE: if table already exists, the csv columns must be in same order as table schema
- If table doesn't exist, a table is created from the columns in the CSV (in the same order)

```sqlite
.mode csv
.import test.csv foo
```

query csv one-liner:

- import into memory, then query

```bash
sqlite3 :memory: -csv -cmd '.import taxi.csv taxi' \
  'SELECT passenger_count, COUNT(*), AVG(total_amount) FROM taxi GROUP BY passenger_count'
```



# SQL.js 

Emscripten port of sqlite
https://sql.js.org/#/







