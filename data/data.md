

This cheatsheet groups common actions across various data tools. Commands are only included here if they can be expressed as relatively simple one-liners.

# view

todo- add "tv"
https://github.com/alexhallam/tv/blob/main/img/sigs.png

```bash
# tsv
<tab-data> | column -t         # column command
<tab-data> | vd                # visidata - tsv (interactive)

# csv
<csv-data> | column -s ,       # column command (-s specifies delimiter)
<csv-data> | vd -f csv         # visidata - csv (interactive)
<csv-data> | csvlook           # csvlook (interactive)

# json
<json-data> | jless            # jless
<json-data> | vd -f json       # visidata (interactive)

# jsonl (json-lines)
<json-lines> | vd -f jsonl     # visidata (interactive)
<todo>                         # jq
<todo>                         # miller

# yaml
<yaml-data> | yq               # yq - 
<yaml-data> | yq -P            # yq - Pretty print
<yaml-data> | vd -f yaml       # visidata (interactive)

# toml

# protobuf

# message pack

# avro


# excel
vd -f xls                      # visidata (interactive)
vd -f xlsx                     # visidata (interacative)


# xml

```

# filter

```bash
# filter out empty lines and/or comments
sed '/^$/d'                # remove empty lines
grep -Ev '^\s*$'           # remove empty lines
sed 's/\#.*$//g'           # remove comments
mlr --skip-comments        # remove comments
datamash --skip-comments   # remove comments
grep -Ev '^\s*$|^\s*\#'    # remove empty lines and comments

# filter out lines / rows
- todo grep
- todo awk
- todo jq
- todo miller
- todo csvkit

# filter out fields / columns
# - by index
awk '{ print $1 }'            # print column 1
awk '{ print $2,$3,$4,$5 }'   # print columns 2-5 (incl.)
cut -d " " -f1                # print column 1
cut -d " " -f2-5              # print columns 2-5 (incl.)
choose 1                      # print column 1
choose 2:5                    # print columns 2-5 (incl.)
# - by name
mlr ... todo ...
todo - jq '... todo ... '

```

# format conversion


```bash
# csv to json
mlr --c2j               # miller 


# json to csv
mlr --j2c               # miller
jq '... | @csv'         # jq
in2csv file.json        # csvkit (infer input type from filename) 
in2csv --format json    # csvkit (force input type)
in2csv --format ndjson  #


# json to yaml
yq -P                   # yq (-P pretty-prints in yaml)


# yaml to json
yq -o=json              # yq


# excel to csv
in2csv file.xls         # csvkit (infers input type from filename extension)
in2csv file.xlsx        # csvkit (infers input type from filename extension)
in2csv --format xls     # csvkit (force input type)
in2csv --format xlsx    # csvkit (force input type)
unoconv -f csv f.xlsx   # libreoffice
```



## tidy / pivot / reshape / crosstab / long-to-wide

comand-line

```bash
# long/untidy input, with headers
#   where: col 1 contains row headers
#          col 2 contains column headers
#          col 3 contains numeric amount to count or aggregate
# ===============================
# cat  subcat  amount
# a    x       3
# a    y       7
# b    x       21
# a    x       40

# miller - reshape (long-to-wide)
# - (!) susceptible to missing values for a given category, 
#       whereas datamash will just print out N/A
#       [edit]: this issue might be solved if you use 'unsparsify' before reshape
mlr reshape -i 
mlr reshape -s subcat,amount

# miller - reshape (wide-to-long)
todo


# visidata
- navigate to field to use for pivot rows, press '!'
- optionally: use '+' to specify additional metrics (default: count)
- navigate to field to use for pivol cols, press 'Shift-W'


# datamash - crosstab
datamash -W --header-in -s crosstab 1,2          # count (default)
datamash -W --header-in -s crosstab 1,2 sum 3    # sum
datamash ... --filler=0                          # populate empties with 0 instead of "N/A")

```



libs

```bash
# javascript
# d3, vega[-lite], plot, etc.
d3 nest 
d3 group

# javascript - arquero
# ====================
import { aq, op } from '@uwdata/arquero'
long_table = aq.from(<array>);
wide_table = long_table
  .groupby(<grouping-field(s))
  .pivot(<column-name-field>, <column-value-field>)

# observable plot



# python - pandas
# ===============
# rows = list of dictionaries, cols_set is list or set of column names
df = pd.DataFrame(rows, columns=col_set)
df.to_csv(<output-filename>)
```



sql

```sql
# postgres - crosstab function
# ============================
# NOTE: requires the tablefunc extension
CREATE EXTENSION IF NOT EXISTS tablefunc;
# then you can...
SELECT * FROM crosstab('select name, exam, score from exams order by 1,2')
           AS ct (name varchar(15),exam1 int, exam2 int, exam3 int, exam4 int);
# where the crosstab query must return 3 columns:
# 1. row names
# 2. column names
# 3. values


# sql server - pivot operator
# ===========================
todo


# sqllite
# =======
todo

```



desktop apps

```bash
# excel - pivot table 
TODO - pivot table

# tableau
TODO
```




# join

```bash

# join (shell)


# csvjoin


# miller



# javascript - d3.zip


# sqllite 
https://www.sqlite.org/csv.html


```



# aggregate

min, max, sum, mean, ...

```bash
# datamash
datamash -W --sort -g 1 sum 2           # whitespace-delimited, sort, group by col 1, sum col 2
datamash -W --sort groupby 1 sum 2      # ""
datamash "" --header-out                # "" with headers


# miller
- see: https://miller.readthedocs.io/en/latest/reference-verbs/#stats1

mlr ... stats1 -a sum -f x,y -g month


aggregation functions:
- min
- max
- sum
- mean
- median
- p10, p50, p95, p##...
- ...

puts new fields suffixed with aggregation type (eg. x_sum)





# excel
- pivot table


# sql


# javascript - vanilla
Math.min(...array);  // min
Math.max(...array);  // max
array.reduce((a, b) => a + b, 0); // array.reduce((a, b) => a + b, 0) / array.length;  // mean

var array = [
  { Id: "001", qty: 1 }, 
  { Id: "002", qty: 2 }, 
  { Id: "001", qty: 2 }, 
  { Id: "003", qty: 4 }
];

// aggregate by group
var result = [];
array.reduce(function(res, value) {
  if (!res[value.Id]) {
    res[value.Id] = { Id: value.Id, qty: 0 };
    result.push(res[value.Id])
  }
  res[value.Id].qty += value.qty;
  return res;
}, {});


# javascript - d3
// min/max/sum
d3.min(<iterable>[, accessor])
d3.max(<iterable>[, accessor])
d3.sum(...)
d3.mean(...)
d3.median(...)
d3.variance(...)
... lots more

// grouping, aggregation
d3.rollup(array, <reducer-fn>, <group-accessor-fn>)
d3.rollup(array, v => d3.sum(v, d => d.earnings), d => d.sport)


```



sliding window aggregation

```bash
# miller
# https://miller.readthedocs.io/en/latest/reference-verbs/#step
mlr step -f <field(s)> -a <stepper
-a slwin_7_0                # average of last 7 values

# steppers:
counter    Count instances of field(s) between successive records
delta      Compute differences in field(s) between successive records
ewma       Exponentially weighted moving average over successive records
from-first Compute differences in field(s) from first record
ratio      Compute ratios in field(s) between successive records
rsum       Compute running sums of field(s) between successive records
shift      Alias for shift_lag
shift_lag  Include value(s) in field(s) from the previous record, if any
shift_lead Include value(s) in field(s) from the next record, if any
slwin      Sliding-window averages over m records back and n forward. E.g. slwin_7_2 for 7 back and 2 forward.


# sql
# window functions
# https://www.sqlite.org/windowfunctions.html
SELECT a, b, group_concat(b, '.') OVER (
  ORDER BY a ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
) AS group_concat FROM t1;



# - taken from: https://stackoverflow.com/questions/66498051/rolling-7-day-average-using-calculated-averages
# - table tbl
select t.*, coalesce(t.avgvalue, t2.avgvalue7)
from tbl t outer apply
     (select avg(t2.avgvalue) as avgvalue7
      from (select top (7) t2.avgvalue
            from tbl t2
            where t2.avgvalue is not null and
                  t2.date < t.date
            order by t2.date desc
           ) t2
     ) t2;


# excel
- Data Analysis -> Moving Average


# javascript
someArray = [1, 2, 3, 4, 5, 6, 7, NaN, 9, 10];
var before=2; // num of elements before index to include in window
var after=2;  // num of elements after index to include in window
someArray.map((element, i, array) => {
  const subArray = array.slice(Math.max(i-before, 0), Math.min(i+after+1, array.length))
    .filter(v => !Number.isNaN(v)); // remove any NaN
  return {
    "window_sum": subArray.reduce((a, b) => a + b, 0),
    "window_mean": subArray.reduce((a, b) => a + b, 0) / subArray.length,
    "window_min": Math.min(...subArray), // destructuring converts arrays to the individual values that Math fns want
    "window_max": Math.max(...subArray)    
  };
});


```



# chart

bar

```bash
# miller
# - see 'data/tabular/miller.md'
# - ensure data has at least one numeric column to convert to bars
# - copy column if you want both bar and metric in same output
# - will *replace* numeric field with bar text field
mlr ... put '$bars=$metricField' then bar -f bars -c █ -b " " --lo 0 --hi 500

# visidata
todo

# gnuplot

# excel
- data bars

# sql - sqlite
# use format string with a dynamic quanitifier
# printf('%.5c', '█') will print 5 bar chars
# printf('%.' || <int-calculation> ||'c', '█') will produce the number of bars matching calculation result
# use calculation: <max-bars>*(<metric>-<min>)/(<max>-<min>)
# ! calculation must return an int, else format string won't be valid
select *,printf('%.' || cast(10*(room_temp-20.0)/(30-20) as int) ||'c', '█') as bars

# sql - postgres
# https://www.postgresql.org/docs/current/functions-string.html#FUNCTIONS-STRING-FORMAT
# same as sqlite, but use 'format' fn
select *,format('%.' || <calculation> || 'c', '█') as bars
```

heatmap

```bash


# excel
- pivot table, with conditional formating using color scales

# observable/d3/plot


```

