





## sort + join

```bash
sort -t , -k 2,2 file1.csv > sort1.csv   # -k 2,2 : character sort on 2nd field
sort -t , -k 1,1 file2.csv > sort2.csv   # -k 1,1 : character sort on 1st field
join -t , -1 2 -2 1 sort1.csv sort2.csv > sort3.csv # -1 2 -2 1: file 1, 2nd field, file 2, 1st field

# where:
# -t ,    use ',' as the field separator

```

