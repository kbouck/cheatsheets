

# by character
```
-c1-3    # char range 1-3
-c-3     # char range 1-3
-c3-     # char range 3..end
```

# by field
```
-f1-3    # field range 1-3
-f-3     # field range 1-3
-f3-     # field range 3..end
```

# misc 
```
--complement    # invert selection (like -v in grep)
```

# delimiters
```
-s   # suppress lines without delimiters

# input 
# - NOTE: must be single byte char 
-d,        # comma
-d' '      # space


# output 
# - NOTE: defaults to input delimiter
--output-delimiter=,    # comma
output-delimiter=' : '  # field : field
```
