

# file formats

```bash
# delimeter-separated
vd               # tab-delimited (default)
vd -f tsv        # tab-delimited (default)
vd -f csv        # comma-delimited
vd -f dsv        

# json et al
vd -f json       # json object array
vd -f jsonl      # json-lines

# excel
vd -f xls
vd -f xlsx

# yaml
vd -f yaml
```

#                                navigation

```bash
# sheet
q             # quit current sheet
gq            # quit visidata 
ctrl-c        # abort current command
shift-u       # undo
shift-r       # redo
<arrow-keys>  # navigate sheet
h,j,k,l       # navigate

# column name
e           # edit column name

# column type
~           # string (non-numeric)
#           # int (numeric)
%           # float (numeric)
$           # currency (numeric)
@           # date (numeric)

# column width 
_           # expand current column
g_          # expand all columns
-           # hide current column (sets width=0)
gv          # unhide all columns

# column (and row) order
shift-H     # move column left
shift-L     # move column right
shift-J     # move row down
shift-K     # move row up

# sort
[           # sort ascending
]           # sort descending

# filter
| <filter>  # filter rows by value 

# search
/ <regex>   # search by regex
```

# graph

```bash
!                     # graph single (numeric) column
```







