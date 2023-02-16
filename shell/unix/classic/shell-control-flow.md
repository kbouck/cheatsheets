
more tricks at

https://raimonster.com/scripting-field-guide/

# loops

```bash
# for
for i in {0..9}
for (( i=0; i<10; i++ ))
for i in $list
for i in $(ls *.json)
for i in "${!array[@]}"  # key: $i, value: ${array[$i]}


# while
while [ condition-is-true ]
do 
 command(s)... 
done

# while - over heredoc lines
while IFS= read -r line ; do echo $line; done <<< "$variable"




# until
until [ condition-is-true ]
do 
 command(s)... 
done



```

# switch

```bash
```

