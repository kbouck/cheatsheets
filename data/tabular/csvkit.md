



# csv



## common arguments

https://csvkit.readthedocs.io/en/latest/common_arguments.html

list of arguments common to many tools

```
-d DELIMITER, --delimiter DELIMITER
                      Delimiting character of the input CSV file.

-t, --tabs            Specify that the input CSV file is delimited with
                      tabs. Overrides "-d".

-q QUOTECHAR, --quotechar QUOTECHAR
                      Character used to quote strings in the input CSV file.

-u {0,1,2,3}, --quoting {0,1,2,3}
                      Quoting style used in the input CSV file. 0 = Quote
                      Minimal, 1 = Quote All, 2 = Quote Non-numeric, 3 =
                      Quote None.

-b, --no-doublequote  Whether or not double quotes are doubled in the input
                      CSV file.

-p ESCAPECHAR, --escapechar ESCAPECHAR
                      Character used to escape the delimiter if --quoting 3
                      ("Quote None") is specified and to escape the
                      QUOTECHAR if --no-doublequote is specified.

-z FIELD_SIZE_LIMIT, --maxfieldsize FIELD_SIZE_LIMIT
                      Maximum length of a single field in the input CSV
                      file.

-e ENCODING, --encoding ENCODING
                      Specify the encoding of the input CSV file.

-L LOCALE, --locale LOCALE
                      Specify the locale (en_US) of any formatted numbers.

-S, --skipinitialspace
                      Ignore whitespace immediately following the delimiter.

--blanks              Do not coerce empty, "na", "n/a", "none", "null", "."
                      strings to NULL values.

--date-format DATE_FORMAT
                      Specify a strptime date format string like "%m/%d/%Y".

--datetime-format DATETIME_FORMAT
                      Specify a strptime datetime format string like
                      "%m/%d/%Y %I:%M %p".

-H, --no-header-row   Specify that the input CSV file has no header row.
                      Will create default headers (a,b,c,...).

-K SKIP_LINES, --skip-lines SKIP_LINES
                      Specify the number of initial lines to skip before the
                      header row (e.g. comments, copyright notices, empty
                      rows).

-v, --verbose         Print detailed tracebacks when errors occur.

-l, --linenumbers     Insert a column of line numbers at the front of the
                      output. Useful when piping to grep or as a simple
                      primary key.

--zero                When interpreting or displaying column numbers, use
                      zero-based numbering instead of the default 1-based
                      numbering.

-V, --version         Display version information and exit.
```



## csvlook

https://csvkit.readthedocs.io/en/latest/scripts/csvlook.html

```bash
csvlook data.csv             # print csv in fixed-width format 
(csv output) | csvlook       # print csv in fixed-width format
csvlook data.csv | less -S   # suppress word-wrapping, horizontal navigation with arrow keys
```



## csvcut

```bash
csvcut -n data.csv          # display only column indices/names and exit

csvcut -c a,c data.csv      # select only columns named 'a' and 'c'
csvcut --columns ...        # "

csvcut -C a,c data.csv      # select all other columns not named 'a' or 'c'
csvcut --not-columns ...    # "

csvcut -c c,a data.csv      # reorder columns

csvcut -x                   # delete rows which are empty after cutting
csvcut --delete-empty-rows  # "


csvcut -c 1,3 data.csv                       # show columns 1 and 3
csvcut -c 1 data.csv | sed 1d | sort | uniq  # show unique values for column 1
csvcut -c TOTAL,"State Name" data.csv        # show columns "TOTAL" and "State Name"

```



## csvclean

- reports rows that have a different number of columns than the header row
- attempts to correct the CSV by joining short rows into a single row



## csvgrep

```bash
csvgrep -c a -r "regex.*" data.csv  # search column 'a' for /regex.*/
csvgrep -c 1 -r "(?i)illinois"      # search column 1 case-insensitive regex (?i)illinois

csvgrep -m pattern     # String match
csvgrep --match ...    # "

csvgrep -r regex.*     # Regex match
csvgrep --regex ...    # "

csvgrep -f match-file  # matches if any row in match-file is an exact match for cell value
csvgrep --file         # "

csvgrep -i             # invert match
csvgrep --invert-match # "

csvgrep -a             # select on *any* column match, rather than *all* columns match
csvgrep --any-match    # "
```



## csvformat

```bash
csvformat -D "|"        # change delimeter
csvformat -M $'\r'      # change line-endings to carriage return
```



## csvjoin

usage (common options)

```
csvjoin [-c COLUMNS] [--outer] [--left] [--right] [FILE [FILE ...]]
```

options:

```bash


-c COLUMNS,           # single name/index or comma-separated names/indices
--columns COLUMNS     # in same order as files were specified
          
--outer               # full outer join (rather than the default inner join)
--left                # left outer join   
--right               # right outer join (rather than the default inner join) 

```

examples

```bash
csvjoin -c 1 a.csv b.csv

```



## csvsort

```bash
csvsort -c COLUMNS        # sort by column(s) - can be multiple
csvsort --columns ...     # "

csvsort -r                # reverse sort order
csvsort --reverse         # "
```



## csvstack

```

```



## csvstat

```bash
csvstat data.csv  # statistics?  

```



# fixed-width

Input

```bash
in2csv

in2csv -f fixed -s schema.csv input.fixed     # input from fixed-width file using schema.csv 
in2csv ... --no-header-row                    # suppress header row
```



Output

```bash
csvlook data.csv             # output csv file in fixed-width format 
(csv output) | csvlook       # output csv stdout in fixed-width format
```

fixed-width shema file format:

```csv
column,start,length
name,0,30
birthday,30,10
age,40,3
```

# excel

```bash
in2csv data.xls       # excel to csv
in2csv --sheet SHEET  # excel sheet to read


```



# json

```bash
in2csv data.json  # json to csv
csvjson data.csv  # csv to json

```



# sql

```bash
csvsql   # generate SQL statements for CSV files 
sql2csv  # execute arbitrary commands against SQL db, return results as CSV

csvsql --query "select name from data where age > 30" data.csv     # sql query csv file

sql2csv query.sql                                                  # sql query from file
sql2csv --db postgresql:///database --query "select * from data"   # sql query in-line 
csvsql --db postgresql:///database --insert data.csv               # import into postgres

# Postgres
sql2csv --db postgresql:///database
csvsql --db postgresql:///database --insert data.csv               # import csv data
csvsql --db postgresql:///kbouck --insert ../terminals.csv
csvsql --db postgresql:///kbouck --insert ../terminals.csv --tables terminals  # use table name


# SQLite
csvsql --db "sqlite:///dummy.db" --tables "test" --insert data.csv  # import csv data
sql2csv --db "sqlite:///dummy.db" --query "select * from test"      # query data

# MySQL
sql2csv --db 'mysql://user:pass@host/database?charset=utf8'

```



# money project

```bash
# insert transactions
csvsql --db postgresql:///kbouck --insert --no-create transactions_abn_personal_2020.csv --tables transactions
 
# insert categories
in2csv -s ../regex_schema.csv ../regex.fixed | csvsql --db postgresql:///kbouck --insert --tables regex
in2csv ../ibans_latest.csv | csvsql --db postgresql:///kbouck --insert --tables iban
csvsql --db postgresql:///kbouck --insert ../terminals_latest.csv


# insert categories by regex
cat categories_by_regex.txt | sed 's/\#.*$//g' | grep -Ev '^\s*$' | in2csv -f fixed -s categories_by_regex_schema.json | csvsql --db postgresql:///kbouck --insert --tables cat_by_regex --overwrite

# insert categories by terminal
cat categories_by_terminal.txt | sed 's/\#.*$//g' | grep -Ev '^\s*$' | in2csv -f fixed -s categories_by_terminal_schema.json | csvsql --db postgresql:///kbouck --insert --tables cat_by_terminal --overwrite

# insert categories by iban
cat categories_by_iban.txt | sed 's/\#.*$//g' | grep -Ev '^\s*$' | in2csv -f fixed -s categories_by_iban_schema.json | csvsql --db postgresql:///kbouck --insert --tables cat_by_iban --overwrite




```



```sql
select 
    txn.*, 
    coalesce(r.category, term.category, i.category) as cat,
    coalesce(r.subcategory, term.subcategory, i.subcategory) as subcategory,
    -- r.regex as "r_regex",
    -- r.category as "r_category", 
    -- r.subcategory as "r_subcategory",
    -- term.category as "term_category",
    -- term.subcategory as "term_subcategory",
    -- i.category as "i_category",
    -- i.subcategory as "i_subcategory"
from transactions txn
left join regex r on LOWER(txn.desc) ~ LOWER(r.regex) 
left join terminals_latest term on txn.terminal_id = term.terminal
left join iban i on txn.recv_iban = i.iban
```





```sql
-- Drop table
DROP TABLE transactions;

-- Create table
CREATE TABLE transactions (
	"date"         date NOT NULL,
	"timestamp"    timestamp with time zone NULL,
	amount_credit  numeric(10,2) NULL,
	amount_debit   numeric(10,2) NULL,
	amount         numeric(10,2) NOT NULL,
	amount_abs     numeric(10,2) NOT NULL,
	"desc"         varchar NULL,
	desc_full      varchar NULL,
	desc_grep      varchar NULL,
	terminal_id    varchar NULL,
	"type"         varchar NULL,
	card_num       varchar NULL,
	recv_iban      varchar NULL,
	recv_name      varchar NULL,
	recv_bic       varchar NULL,
	kenmerk        varchar NULL,
	country        varchar NULL
);

```







```sql
CREATE VIEW transactions_categorized
    AS 
select 
    txn.*, 
    coalesce(cat_t.category, cat_r.category, cat_i.category) as cat,
    coalesce(cat_t.subcategory, cat_r.subcategory, cat_i.subcategory) as subcategory
from transactions txn
left join cat_by_regex r on LOWER(txn.desc) ~ LOWER(r.regex) 
left join cat_by_terminal term on txn.terminal_id = term.terminal
left join cat_by_iban i on txn.recv_iban = i.iban
```

