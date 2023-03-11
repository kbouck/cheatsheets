```bash
uniq                # unique lines
uniq -c             # unique lines (preceded by count)
uniq -c | sort -n   # "", by ascending count
uniq -c | sort -nr  # "", by descending count
```

# options
```bash
# output options
-c       # show count
-d       # show duplicate lines only once
-D       # show all duplicate lines
-u       # show unique lines only

# comparison options
-i       # ignore case
-f<n>    # skip n fields, using field n+1 for comparison 
-s<n>    # skip n bytes, using bytes n+1 onwards for comparison
-w<n>    # only consider first n bytes

# output options
--group  # separate groups by empty line
```