

# one-liners
```bash
lines=$(wc -l file.txt)  # capture line count
bytes=$(wc -c file.txt)  # capture byte count
```


# options
```bash
-l       # line count
-w       # word count
-c       # byte count
-L       # longest line length 
```


# multiple files 
```
$ wc greeting.txt nums.txt purchases.txt
 2  6 25 greeting.txt
 3  3 13 nums.txt
 8  9 57 purchases.txt
13 18 95 total


$ wc greeting.txt nums.txt purchases.txt | tail -n1 
13 18 95 total
```