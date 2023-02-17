# usage

```bash
mlr <options> <verb <options>> [then <verb <options>>...] <input-file>
<tabular-data> | mlr ...
```

# options

```bash
--skip-trivial-records       #
--skip-comments              # skip comments prefixed with #
--ragged
--allow-ragged-csv-input


$ mlr help format-conversion-keystroke-saver-flags
...
| In\Out | CSV   | TSV   | JSON   | JSONL  | DKVP   | NIDX   | XTAB   | PPRINT | Markdown |
+--------+-------+-------+--------+--------+--------+--------+--------+--------+----------+
| CSV    |       | --c2t | --c2j  | --c2l  | --c2d  | --c2n  | --c2x  | --c2p  | --c2m    |
| TSV    | --t2c |       | --t2j  | --t2l  | --t2d  | --t2n  | --t2x  | --t2p  | --t2m    |
| JSON   | --j2c | --j2t |        | --j2l  | --j2d  | --j2n  | --j2x  | --j2p  | --j2m    |
| JSONL  | --l2c | --l2t |        |        | --l2d  | --l2n  | --l2x  | --l2p  | --l2m    |
| DKVP   | --d2c | --d2t | --d2j  | --d2l  |        | --d2n  | --d2x  | --d2p  | --d2m    |
| NIDX   | --n2c | --n2t | --n2j  | --n2l  | --n2d  |        | --n2x  | --n2p  | --n2m    |
| XTAB   | --x2c | --x2t | --x2j  | --x2l  | --x2d  | --x2n  |        | --x2p  | --x2m    |
| PPRINT | --p2c | --p2t | --p2j  | --p2l  | --p2d  | --p2n  | --p2x  |        | --p2m    |


## csv
# - https://miller.readthedocs.io/en/latest/file-formats/#csvtsvasvusvetc
mlr -c                       # csv to csv
mlr --csv                    # csv to csv
mlr --icsv --opprint         # csv to fixed
mlr --icsv --oasv            # csv to asv
mlr --c2p                    # csv to fixed
mlr --icsv                   # csv to ...
mlr -i csv                   # csv to ...
mlr --ocsv                   # ... to csv
mlr -o csv                   # ... to csv
mlr --icsv --ojson           # csv to json
mlr -i csv -o json           # csv to json
mlr --c2j                    # csv to json
mlr --c2l                    # csv to json-lines
mlr --ipprint --ocsv         # fixed to csv
mlr --p2c                    # fixed to csv
mlr --ijson --ocsv           # json to csv
mlr --j2c                    # json to csv
mlr --l2c                    # json-lines to csv
mlr --iasv --ocsv            # asv to csv
mlr --headerless-csv-output  # csv output without headers
mlr --implicit-csv-header label name,age,status  # provide headers
mlr -N                       # alias for: --implicit-csv-header --headerless-csv-output`
mlr unsparsify               # ensure every record has same keys


## json / ndjson / json-lines
mlr -j                  # json to json
mlr --json              # json to json (same as -j)
mlr --j2c               # json to csv
mlr --l2c               # json-lines to csv
mlr --j2p               # json to fixed
mlr --c2j               # csv to json
mlr --c2l               # csv to json-lines
mlr --p2j               # fixed to json
mlr --ijson             # json to ...
mlr --ijsonl            # json-lines to ...
mlr --ojson             # ... to json
mlr --ojsonl            # ... to json-lines 

## fixed-width / pretty-print
mlr --pprint            # fixed to fixed
mlr --p2c               # fixed to csv
mlr --p2j               # fixed to json
mlr --p2l               # fixed to json-lines
mlr --c2p               # csv to fixed
mlr --j2p               # json to fixed
mlr --l2p               # json-lines to fixed
mlr --ipprint           # fixed to ...
mlr --opprint           # ... to fixed
--barred                # output border around all fields
--right                 # right-justify all fields

# nest / flatten / unflatten
--flatsep :                # [un-]flatten separator (eg. :, ., /?)

# numbeic type coersion / formatting
--infer-int-as-float, -A   # coerce all ints to floats
--infer-none, -S           # don't coerce numeric types (leave as strings)
-n                         # Coerce field values autodetected as int to float, and then apply the float format.
--ofmt <format-string>     # simialar to printf format string, see: https://pkg.go.dev/fmt
       %-i                 # todo
       %.0f                # 1, 2 (float rounded up to int)
       %.2f                # 1.22
       %2.2f               # 
       %s                  # string format

# date/time
--tz <timezone>            # timezone to use with 'local' date/time functions eg. Europe/Amsterdam

# comments
--pass-comments            # write comments to stdout (not part of data stream)
--skip-comments            # ignore commented lines
```

# verbs

https://miller.readthedocs.io/en/latest/reference-verbs/

## cat / tac 

- output all rows
- https://miller.readthedocs.io/en/latest/reference-verbs/#cat
- https://miller.readthedocs.io/en/latest/reference-verbs/#tac

```bash
cat                          # output 
tac                          # output reverse
```

## head / tail

- output limited number of rows
- https://miller.readthedocs.io/en/latest/reference-verbs/#head
- https://miller.readthedocs.io/en/latest/reference-verbs/#tail

```bash
head -n 2                    # keep only first 2 rows
tail -n 2                    # keep only last 2 rows
```

## cut / template

- exclude, or include-only specific columns
- https://miller.readthedocs.io/en/latest/reference-verbs/#cut
- https://miller.readthedocs.io/en/latest/reference-verbs/#template

```bash
cut -f col1,col2             # keep fields col1,col2, keep original order
cut -f col1,col2 -o          # keep fields col1,col2, use specifed order
cut -f col1,col2 -x          # remove fields col1,col2
template -f col1,col2        # output only fields col1,col2, in order and add if missing 
```

## sort

- order rows
- https://miller.readthedocs.io/en/latest/reference-verbs/#sort

```bash
sort -f col1                 # sort alphanum on col1
sort -f col1 -nr col2        # sort alphanum on col1, then numerically desc on col2

# options
-f                           # Lexical ascending
-r                           # Lexical descending
-c                           # Case-folded lexical ascending
-cr                          # Case-folded lexical descending
-n                           # Numerical ascending; nulls sort last
-nf                          # Same as -n
-nr                          # Numerical descending; nulls sort first
-t                           # Natural ascending
-tr                          # Natural descending
```

## reshape

- pivot data
- https://miller.readthedocs.io/en/latest/reference-verbs/#reshape

```bash
# wide-to-long, tidy-to-untidy
reshape -i <input-field(s)> -o <output-key-field,output-value-field>
reshape -r <input-field-regex(es)> -o <output-key-field,output-value-field>

# long-to-wide, untidy-to-tidy
reshape -s <input-key-field,input-value-field>
```

## rename

- change column name(s)
- https://miller.readthedocs.io/en/latest/reference-verbs/#rename

```bash
rename "<old>,<new>"            # exact-match replace field name
rename -r "<old-regex>,<new>"   # regex replace field name, first-match only
rename -g "<old-regex>,<new>"   # regex replace field name(s), global match 
rename -r "\-,_"                # replace - with _ in field names

TODO:
- add examples using capture group in new name
- example using case-insentive regex
```

## bar

- replace numeric column values with bar chars
- https://miller.readthedocs.io/en/latest/reference-verbs/#bar

```bash
# example 
bar -f bars --lo "0.0" --hi 500 -c "█" -b " " -x '!'

# bar options
-f <f1[,f2]>      # field(s) to convert to bars, comma-separated
--lo <min>        # range min           (default '0.0')
--hi <max>        # range max           (default '100.0')
-w <width>        # bar max-width:      (default '40')
--auto            # automatically compute limits (ignoring --lo and --hi)
                  # ** NOTE: holds all records in memory before producing output
-c <char>         # bar char            (default '*', others: ▁▂▃▄▅▆▇█▀▔▓▒░)
-x <char>         # out-of-bounds char  (default '#')
-b <char>         # blank char          (default '.')
```

## filter

- exclude rows
- https://miller.readthedocs.io/en/latest/reference-verbs/#filter

```bash
# dsl expression must return boolean (true=keep)
filter <dsl-expr>                           
filter 'is_null($field)'                      # show only rows missing a field value
filter '$field == "red"'                      # equality filter on field value
filter '$field1 == "red" && $field2 == true'  # filter on multiple field values
filter '$Total > 1000'                        # numeric filter on field value
filter '${field with spaces} == "red"'        # field name with spaces  
filter -f <dsl-expr-file>                     # dsl expression from file
filter -f <dsl-expr-file> -e <dsl-expr>       # dsl expression from file and command-line
filter -x ...                                 # invert boolean dsl expression result (true=discard)
filter '($x > 0.5 && $y < 0.5) || ($x < 0.5 && $y > 0.5)'
```

## join

- merge rows from multiple datasets
- https://miller.readthedocs.io/en/latest/reference-verbs/#join

```bash
# "left" will be the lookup table
# "right" will be the main file miller is working with
-f <file>                # left file name (the lookup file)
-j <right-join-field>    # right join field
-l <left-join-field>     # left join field name (defaults right join field)
-u                       # enable unsorted input (less efficient, entire left loaded into memory)
-lp <prefix>             # prefix for non-join output fields from left
-rp <prefix>             # prefix for non-join output fields from right

# ... more options in docs
```

## split

- https://miller.readthedocs.io/en/latest/reference-verbs/#split

- split into multiple output files

```bash
-n {n}             # split by max n records
-m {m}             # split max m output files (round-robin among files)
-g <field>         # Write separate files with records having distinct values for field (eg. year, month
-g <field1,2,n>    # "" a, then b, then c
--prefix {p}       # output filename prefix (default: "split")
--suffix {s}       # output filename suffix (default: depends on output format)
```



## step

- step aggregation
- https://miller.readthedocs.io/en/latest/reference-verbs/#step

```bash
-a <agg-fn>        
-a counter         # 
-a delta           # difference in field value compared with prev/next row  
-a slwin_m_n       # sliding window average from m rows back to n rows forward
-g <field>         # group by field
-g <field1,2,n>    # group by fields
```



## put

- modifying records using dsl expression
- https://miller.readthedocs.io/en/latest/reference-verbs/#put

```bash
put -q              # quiet. only output emits
put '<dsl-expr>'
put '$newfield1 = $oldfield1; $newfield2 = $oldfield2'
put '$xy = sqrt($x**2 + $y**2)'
```



## other  verbs

- verbs that didn't deserve their own block
- https://miller.readthedocs.io/en/latest/reference-verbs/

```bash
flatten / unflatten    # a.b.c=4  <=>  { "a": { "b": { "c": 4 }}}
label <field-list>     # set field labels
regularize             # sort by key order
reorder                # specify key order
remove-empty-columns   # 
sec2gmt                # epoch to date-time (also as function)
sec2gmtdate            # epoch to date (also as function)
sample                 # select sample of rows
shuffle                # 
seqgen                 # produce sequence similar to 'seq' command
skip-trivial-records   # skip rows with zero fields
unsparsify             # ensure all records contain same fields
```



# dsl

- https://miller.readthedocs.io/en/latest/reference-dsl/

```bash
# built-in variables
NF           # field number
NR           # record number (global)
FNR          # record number (this file)
FILENUM      # file number
FILENAME     # filename
M_PI         #
M_E          # 

# referencing fields
$f             # value of field named 'f'
${some field}  # value of field named 'some field' (eg. with spaces in name)
$[[n]]         # name of n-th field
$[[[n]]]       # value of n-th field
$*             # map of all fields
               # can be used to set all fields

# assigning field values
'$newfield1 = $oldfield1; $newfield2 = $oldfield2'
'$xy = sqrt($x**2 + $y**2)'

# unsetting fields
$x=""
@x=""
unset $x, $a

# map literal
$* = {
    "s": $a + $b,
    "t": $a - $b,
    "u": f(
      $a,
      $b,
    ),
    "v": NR,
}

# boolean expressions
<, <=, =>, >            # 
==, !=, =~, !=~, <=>    # 
&&, ||                  # and, or
?, :                    # ternary
??, ???                 #
```

## regex

```bash
$shape =~ "^(...)(...)$";
# For records that do pass through, capture the first "(...)" into $left and
# the second "(...)" into $right
$left = "\1";
$right = "\2";
```

## loops

```bash
# loop over map elements
for (e in o) {
  print "key:", e, "valuetype:", typeof(o[e]);
}

# loop over map, single key
for (key, value in $*) {
  if (key =~ "^f[0-9]+") {
     $sum2 += value;
     $sum3 += $[key];
  }
}

# loop over map, multiple keys 
for ((k1, k2), value in $*) ...

```



## built-in functions

```bash
# null, empty
is_empty              # field present, value empty
is_not_empty          # field present, value not empty
is_absent             # field not present
is_present            # field present
is_null               # either field not present, or value empty
is_not_null           # field present, and value not empty

# numbers
int                   # coerce to int
float                 # coerce to float

# string

gsub(<string>, <regex>, <replacement>)     # capture groups \1 through \9 in replacement

# date/time
# =========
# mostly inherits from go's date library
#
# %Y-%m-%dT%H:%M:%SZ     2015-08-28T13:33:21Z
# %Y-%m-%dT%H:%M:%3SZ    2015-08-28T13:33:21.700Z
# %Y-%m-%d %H:%M:%S %z   2015-08-28 16:33:21 +0300
#
gmt2localtime                      # GMT date-time to local date-time
gmt2sec                            # GMT date-time to epoch seconds
localtime2gmt                      # local date-time to GMT date-time (local timezone in $TZ)
localtime2sec                      # local date-time to epoch seconds (local timezone in $TZ)
sec2gmt                            # epoch seconds to GMT date-time
sec2gmtdate                        # epoch seconds to GMT date
strftime(<epoch>, <date-fmt>)      # epoch seconds to date string
strftimelocal                      # "", uses $TZ (eg. TZ="Europe/Amsterdam")
strptime(<date-str>, <date-fmt>)   # date string to epoch seconds
strptimelocal                      # "", uses $TZ (eg. TZ="Europe/Amsterdam")
systime                            # epoch seconds (floating point)
systimeint                         # epoch seconds (integer)
substr(<date-str>, 0,3)            # get year from iso8601/rfc339 date string
substr(<date-str>, 0,6)            # get year-month from iso8601/rfc339 date string
substr(<date-str>, 0,9)            # get year-monty-day from iso8601/rfc339 date string
substr($startDate,0,21)."00"       # convert timezone from +20:00 to +2000
# to compare dates, convert to epoch and use numeric comparison
strptime($date, "%Y-%m-%d") > strptime("2018-03-03", "%Y-%m-%d")  # test if date greater than
strptime(substr($startDate,0,21)."00", "%Y-%m-%dT%H:%M:%S%z")     # convert timezone from +20:00 to +2000
```

## user-defined functions

```bash
# correct any reasonable date string to comply w/ iso8601 format
func date(date_str) {
    # ensure 'T' separator

    # correct timezone
    # +00:00 => +0000

    if (is_numeric(n)) {
        if (n > 0) {
            return n * f(n-1);
        } else {
    return 1;
}

# convert any date representation to epoch seconds
func epoch(n) {

}
    
alias mlr='mlr --load ~/dev/miller/global-functions.mlr'
```

# examples/ideas

## lookup table

```
# Add entries in first (lookup) file to a map
if (FILENUM == 1) {
  # add record to map, keyed by field X
  print "file 1"
  
} else {
  print "file 2"
  # mutate record with if any lookup data matches 
} 

end {
  print "end";
}
```

