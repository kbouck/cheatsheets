

one-liners

```bash
find . -name "*slf4j*"                     # recursively find any files namtching name regex



find . -type f -size +512M -print          # list all files with size > 512MB
find . \( -name "*.c" -o -name "*.h" \)    # list all .c or .h files


# TODO need more examples of size, atime, mtime, etc.

# find + grep
find . -iname "*.json" -exec grep 'statements_*' {} ";"  # execute grep command on each file found



find . -type f -mmin -90                               # Find all files modified in the last 90 minutes  
find . -type f -mmin -90 | xargs ls -l                 # Find all files and do something to each one   
find . -type f -mtime +2                               # Find all files modified before 2 days ago 
find . -type f -mtime +7 -name '*.gz' -exec rm {} \;   # Removing files older than 7 days  
find . -type f -mtime -2                               # Find all files modified after last 2 days 
find . -type f -mtime 2                                # Find all files modified at the last 2 day mark  


```





## anatomy

```bash
find /opt -name "TEST*" -exec wc -l {} ";"
     ---- ------------- -------------- ---
     |    |             |           |   |
     |    |             |           |   if ";", TODO - see man page
     |    |             |           |   if "+", 
     |    |             |           |   
     |    |             |           found filename
     |    |             action
     |    criteria
     path(s)

```


## paths

```bash
find /opt        # single path
find /opt /usr   # multiple paths

```


## criteria

```bash
-name, 
-iname 
-type <f,d,l>
-inum <n>
-user <name>
-group <group>
-perm <u,g,o>
-size +x[c]      # size greater than (eg. -size +512M)
-empty
-newer <file>
-atime +x
-amin +x
-mmin -x
-mtime -x
-a               # and
-o               # or
-maxdepth <n>
```



## actions

```bash
-print           # display filename (this is default)
-ls              # run ls -lids on each resulting file
-exec <command>  # execute command for each file
-ok <command>    # execute command for each file after user confirmation
```

