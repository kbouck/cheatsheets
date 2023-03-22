A comparison of common tasks across various data tools. 

This page is focused on concise, composable commands, expressible as one-liners on the command line. It avoids any commands whose expression becomes too verbose.

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
<csv-data> | mlr --c2p cat     # miller (csv to pre)

# json
<json> | gojq                  # gojq
<json> | jless                 # jless
<json> | vd -f json            # visidata (interactive)

# jsonl (json-lines)
<json-lines> | vd -f jsonl     # visidata (interactive)
<json-lines> | gojq            # gojq 
<json-lines> | gojq -c         # gojq - compact (json-lines) output
<json-lines> | jq              # jq
<json-lines> | mlr --json      # miller
<json-lines> | mlr --jsonl     # miller

# yaml
<yaml> | gojq --yaml-input --yaml-output  # gojq - pretty-print
<yaml> | yq                               # yq - fugly-print
<yaml> | yq -P                            # yq - pretty-print
<yaml> | vd -f yaml                       # visidata (interactive)

# toml
<toml> | dasel -r toml -w json  # dasel - output as json
<toml> | rq -t                  # rq - output as json
<toml> | rq -tY                 # rq - output as yaml

# xml
<xml> | xq                      # xq - json output
<xml> | xq -x                   # xq - xml output
<xml> | xq --xml-output         # xq - xml output

# protobuf

# message pack
<msg-pack> | rq -mJ             # rq - output as json
<msg-pack> | rq -mY             # rq - output as yaml


# avro
<avro> | rq -a                  # rq - output as json
<avro> | rq -aY                 # rq - output as yaml

# excel
<xls>  | vd -f xls              # visidata (interactive)
<xlsx> | vd -f xlsx             # visidata (interactive)


```

# filter

```bash
# filter empty lines / comments
sed '/^$/d'                # remove empty lines
grep -Ev '^\s*$'           # remove empty lines
sed 's/\#.*$//g'           # remove comments
mlr --skip-comments        # remove comments
datamash --skip-comments   # remove comments
grep -Ev '^\s*$|^\s*\#'    # remove empty lines and comments

# filter by line/row number
- todo grep
- todo awk
- todo jq
- todo mlr
- todo csvkit

# filter by field/column index
awk '{ print $1 }'            # include col 1
awk '{ print $2,$3,$4,$5 }'   # include col 2-5
cut -d" " -f1                 # include col 1 (space-delimited)
tr -s ' ' | cut -d -f1        # include col 1 (multiple-space-delimited) 
cut -d" " -f2-5               # include cols 2-5
choose 1                      # include col 1
choose 2:5                    # include cols 2-5
mlr cut -f 1                  # include col 1 (data already contains numeric header row) 
mlr -N cut -f 1               # include col 1 (data has no header row, -N adds it) 
mlr -N cut -x -f 1            # exclude col 1 (data has no header row, -N adds it) 

# filter by field/column name
mlr cut -f <col1[,col2,...]>     # include cols 
mlr cut -x -f <col1[,col2,...]>  # exclude cols 
todo - jq '... todo ... '

# filter html by css
<html> | xq -q "body > p"
```

# convert


```bash
# csv
<csv> | mlr --c2j                       # miller - to json

# json
<json> | mlr --j2c cat                  # miller - to csv
<json> | jq '... | @csv'                # jq - to csv
in2csv file.json                        # csvkit (infer input type from filename) 
<json> | in2csv --format json           # csvkit (force input type)
<json> | gojq --yaml-output             # gojq - to yaml
<json> | yq -P                          # yq - to yaml (-P pretty-print)

# jsonl (json-lines)
<json> | in2csv --format ndjson         # csvkit

# yaml
<yaml> | gojq --yaml-input              # gojq - to json 
<yaml> | yq -o=json                     # yq - to json

# toml
<toml> | dasel -r toml -w json          # dasel - to json
<toml> | dasel -r toml -w yaml          # dasel - to yaml
<toml> | rq -t                          # rq - to json
<toml> | rq -tJ                         # rq - to json
<toml> | rq -tY                         # rq - to yaml

# excel to csv
in2csv file.xls                         # csvkit (infers input type from filename extension)
in2csv file.xlsx                        # csvkit (infers input type from filename extension)
in2csv --format xls                     # csvkit (force input type)
in2csv --format xlsx                    # csvkit (force input type)
unoconv -f csv f.xlsx                   # libreoffice
```



# reshape

**tidy / pivot / reshape / crosstab / long-to-wide**

```bash
# long/untidy data
# - is where group/category names area represented in row data, rather than in column headers 
# 
# example below
#   where: col 1 contains group/category names
#          col 2 contains subgroup/subcategory names
#          col 3 contains numeric amount to count or aggregate per group/category
# ===============================
# cat  subcat  amount
# a    x       3
# a    y       7
# b    x       21
# a    x       40
```

**comand-line**

```bash
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

**javascript**

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

```

**python**

```python
# python - pandas
# ===============
# rows = list of dictionaries, cols_set is list or set of column names
df = pd.DataFrame(rows, columns=col_set)
df.to_csv(<output-filename>)
```

**sql**

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

**desktop apps**

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

```bash
# bc
<number-list> | paste -sd+ - | bc       # sum (number-list, one number per line)

# datamash
datamash -W --sort -g 1 sum 2           # sort, group by col 1, sum col 2 (whitespace-delimited input)
datamash -W --sort groupby 1 sum 2      # ""
datamash "" --header-out                # "" with headers


# miller
# - https://miller.readthedocs.io/en/latest/reference-verbs/#stats1
# stats1: adds aggregate result field as name suffixed with agg type (eg. x_sum)
mlr ... stats1 -f x,y -g month -a sum      #
                               -a min      #
                               -a max      #
                               -a mean     #
                               -a median   # 
                               -a p10      # 10th quantile
                               -a p95      # 95th quantile
                               -a pNN      # NN = any number


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



## sliding window

**command-line**

```bash
# miller
# https://miller.readthedocs.io/en/latest/reference-verbs/#step
mlr step -f <field(s)> -a <stepper>     #
                       -a counter       # instance count
                       -a delta         # difference
                       -a ewma          # exponentially-weighted moving average
                       -a from-first    # difference from first record
                       -a ratio         # ratio
                       -a rsum          # running sum
                       -a shift         # (alias for shift_lag)
                       -a shift_lag     # include value(s) from the previous record
                       -a shift_lead    # include value(s) from the next record
                       -a slwin_m_n     # sliding-window average (window is m records back and n forward) 
                                        # E.g. slwin_7_2 for 7 back and 2 forward.
                       -a slwin_7_0     # average of previous 7 values     
```



**SQL**

- sql window functions: https://www.sqlite.org/windowfunctions.html

```sql
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
```

**javascript**

```javascript
// sum/mean/min/max
someArray = [1, 2, 3, 4, 5, 6, 7, NaN, 9, 10];
const window_before = 2;   // window size - before index
const window_after = 2;    // window size - after index
someArray.map((element, i, array) => {
  const subArray = someArray
    .slice(Math.max(i-window_before, 0), Math.min(i+window_after+1, array.length)) // get window slice
    .filter(v => !Number.isNaN(v)); // remove any NaN's
  return {
    "window_sum": subArray.reduce((a, b) => a + b, 0),
    "window_mean": subArray.reduce((a, b) => a + b, 0) / subArray.length,
    "window_min": Math.min(...subArray),  // destructure array as Math fn's want individuals 
    "window_max": Math.max(...subArray)   // destructure array as Math fn's want individuals
  };
});

// quantile (not sure about this function -- need to review)
const quantile = (arr, q) => {
    const sorted = asc(arr);
    const pos = (sorted.length - 1) * q;
    const base = Math.floor(pos);
    const rest = pos - base;
    if (sorted[base + 1] !== undefined) {
        return sorted[base] + rest * (sorted[base + 1] - sorted[base]);
    } else {
        return sorted[base];
    }
};
```

**excel**

```bash
# excel
- Data Analysis -> Moving Average
```

# chart

**command-line**

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
todo
```

**sql**

```sql
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

**javascript**

```javascript
// observable/d3/plot
```

**excel**

```bash
# bar chart (in the cells)
- data bars

# heatmap
- pivot table, with conditional formating using color scales
```

