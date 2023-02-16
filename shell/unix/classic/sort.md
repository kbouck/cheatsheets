## options

```bash
sort            # strings (A..z), case-sensitive
sort -r         # strings (z..A), case-sensitive
sort -n         # integers (1..10)
sort -nr        # integers (10..1)
sort -g         # floats (1.0..10.0)
sort -V         # version strings (1.0.0..1.0.1)
sort -f         # ignore case
sort -u         # supress additional lines that repeat a sort key
sort -k <col>   # field(s)/column(s) to use as sort key
sort -R         # randomize
sort -t <char>  # field separator char
```

## sort key

```bash
sort -k 2 -k 3  # sort by column 2, then by column 3 
```



## sort csv

```bash
sort -t , -k 2   # sort csv by column 2 using field separator ","
```

## sort + join

See 'join' notes

