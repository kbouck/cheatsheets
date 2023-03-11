```bash
# float
echo "1.5+2.3" | bc
bc <<< "scale=2; 1234.56/7.8"  # float precision 2 decimals: 158.27
bc <<< "scale=3; 1234.56/7.8"  # float precision 3 decimals: 158.276

# hex
bc <<< "obase=16; 255"         # decimal to hex: 255 -> FF
bc <<< "ibase=16; FF"          # hex to decimal: FF -> 255

# add list of numbers
<list of numbers, one per line, no blank lines> | paste -sd+ - | bc   # add list of numbers 

# options
-l, --mathlb    # define the standard math libary

# environment variables that affect behvaior
ibase        # input number base (default: 10)
obase        # output number base (default: 10)
scale        # precision (default: 0)
```

