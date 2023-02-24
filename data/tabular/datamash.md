


# input

```bash
                     # default: tab-delimited fields
-W                   # whitespace-delimited fields       <====  
-t,                  # comma-delimited fields
--header-in          # first input line is header names
--sort               # sort input before grouping
-C, --skip-comments  # skip comment lines starting with # or ;
```

output

```bash
--format <format-string>   # numeric formatting style
--output-delimeter <char>  # set output delimiter
```



# grouping / aggregation

```bash
groupby 1 sum 2    # group by column 1 and sum by column 2
```



[this is the link text](../data.md)



# common errors

```bash
datamash: invalid numeric value in line 1 field 3: 'Score'
# data includes header line that needs to be skipped with --header-in, or --headers
```


