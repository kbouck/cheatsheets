

# Variable Expansions

variable manipulations using shell only, not having to create another process. more at https://raimonster.com/scripting-field-guide/

```bash
v=banana
# substitute one
echo ${v/na/NA}   # baNAna

# substitute many
echo ${v//na/NA}  # baNANA

# substitute from the start (think ^ in PCRE)
echo ${v/#ba/NA}  # NAnana

# substitute from the end
echo ${v/%na/NA}  # banaNA

```


## Capture Groups

(taken from https://stackoverflow.com/questions/1891797/capturing-groups-from-a-grep-regex)

```bash
regex="[0-9]+_([a-z]+)_[0-9a-z]*"
if [[ $f =~ $regex ]]
then
    name="${BASH_REMATCH[1]}"
    echo "${name}.jpg"  
fi
```

**Note: regex after =~ must NOT be "quoted"**


## Regex Checkers

https://regexr.com

https://regex101.com

https://www.regular-expressions.info/regexbuddy.html

