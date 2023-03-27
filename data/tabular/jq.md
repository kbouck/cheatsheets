NOTE: ***jq*** and ***gojq*** share the same interface, so can be used (mostly) interchangeably

```bash
# common filters
'.'
'.doc'
'.docline.array'
'.doc.array[0]'
'.doc.array[0].field'



<json> | gojq ''


<json> | gojq -c                   # single-line output per object (array -> json-lines)
              -s                   # slurp all lines into an array (json-lines -> array) 
              -r                   # raw output (no "s around strings )
              --arg <key> <value>  # TODO

```

# strings

```bash
.field[<start>:<end>]    # substring from indices start(inclusive) to end(exclusive)
"\(.field) \(.field2)"   # string interpolation
                         # note: can be any expression inside of the ()'s
[string] | tonumber      # string -> number
[number] | tostring      # number -> string
```

# dates

```bash
# given a string date or timestamp in the form ("2020-01-01T11:22:33")
.date[0:4]               # year (2020)
.date[0:7]               # year-month (2020-02)
.date[0:10]              # year-month-day (2020-01-01)

# selecting by date

```

# filter

```bash
select(has("key"))                           # key existence
select(.key=="value")                        # value exact
select(.key|contains("value"))               # value substring
select(.key|test("blah[0-9]"))               # value regex
select(.key== ("value1","value22")))         # value multiple (same key)  
select(.key1=="value1" or .key2=="value2"))  # value multiple (different keys)
```

# objects

```bash
jq '{ debit, desc_short }'                    # construct object (short-form)
jq '{ debit:.debit, desc_short:.desc_short }' # construct object (long-form)
jq '. += { "label4": "two" }'                 # append entry 
del(.field)                                   # delete entry
del(.field1, .field2)                         # delete multiple entries
```

# arrays

```
# TODO
# map
# to_entries
# reduce
```





# Examples

## json to csv

```bash
(map(keys) | add | unique) as $cols               # get array of field names
| map(. as $row | $cols | map($row[.])) as $rows  # get rows
| $cols, $rows[]                                  # output header, then rows  
| @csv                                            # csv filter

```



# Math

## Aggregate numeric field

The key to doing this is to use -s to slurp multiple objects into elements of a single array

-s: slurp individual records into one big array
select: filter out invalid entries
map: run the internal filter on each array element

```bash
jq -s 'map(select((.desc_short | contains("Deliveroo")) and (.debit != "") and (.debit != "Amount debit")) | .debit | tonumber) | add'
```


Using grep:

```bash
cat abn_personal_2019.ndjson | grep -i toasty | jq -s 'map(.amount) | add'
```


## Aggregate numeric field per group (eg. per-year, or per-month)

This assumes you already have a metric to aggregate and a field to group by (eg. month, category, etc)
-s: slurp all records and present to jq as one big array (needed for group_by)

JSON output

```bash
jq -s 'group_by(.month) | .[] | {month: map(.month)|max, sum: map(.amount)|add}'
```


Text output
-s: slurp
-c: single-line per row of output
-r: raw output (no "'s around strings)

```bash
jq -scr 'group_by(.month) | .[] | "\(map(.month)|max) \(map(.amount)|add)'
```

Examples:

```bash
jq -sr 'group_by(.date[0:7]) | .[] | "\(map(.amount_debit)|add|round) \(map(.date[0:7])|max)"

$ cat *.json | grep -i toasty | jq -sr 'group_by(.date[0:4]) | .[] | "\(map(.amount_debit)|add|round) \(map(.date[0:4])|max)"'
```





# nd-json to elastic bulk api

This example includes extraction of unique document ID and a dynamic index name based on an extracted date field (but does not account for timezone)

Uses 3 jq parameters:
- id_field        field to extract unique doc id
- time_field      field to extract timestamp data from
- index           index pattern (eg, tn-bizdoc-%Y.%m)

    ```bash
    jq -c --arg id_field InternalID --arg time_field Timestamp --arg index "tn-bizdoc-%Y.%m" '{ index: { _index: (.[$time_field][0:19] + "Z" | fromdate | strftime($index)), _id: .[$id_field] }},.' ${input-ndjson} > ${output-bulkapi} 
    ```



