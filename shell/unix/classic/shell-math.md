# alternatives

```bash
expr       # old and superseded by 'let' and double-paren forms
let        # can't do floats.       see unix/classic/let
(( ))      # double-paren form
bc         # use for float, hex.    see unix/classic/bc
```

# Integer


## expr 

WARNING: expr is old and is superseded by 'let' and 'double-paren' forms

```bash
expr 3 + 5       # 8
expr 5 % 3       # 2
expr 1 / 0       # expr: division by zero
expr 5 \* 3      # 15
expr 30 \> 20    # 1 (true)
y=`expr $y + 1`  # increment y by 1

### string operations (move to script_strings)

```bash
b=`expr length $a`  # string length
b=`expr index $a 23`  # index-of
z=`expr substr $string $position $length`  # substring from position to length
b=`expr match "$a" '[0-9]*'`   # regex
b=`expr match "$a" '\([0-9]*\)'`
```

## let

- WARNING: 'let' can't do floats. use 'bc' for floats instead

```bash
let a=b+c     # integer addition
let "a = b + c"
let "z += 3"
```

## double-paren 

```bash
echo $(( 10 + 5 ))  #15

(( i = 0 ))   # set value (spaces on both sides of the "=")
(( i++ ))     # post-increment
(( i-- ))     # post-decrement
(( ++i ))     # pre-increment
(( --i ))     # pre-decrement
z=$(($z+3))
z=$((z+3))
```

# bc

merge with bc page placing note to direct here?

```bash
# float
echo "1.5+2.3" | bc
bc <<< "scale=2; 1234.56/7.8"  # float precision 2 decimals: 158.27
bc <<< "scale=3; 1234.56/7.8"  # float precision 3 decimals: 158.276

# hex
bc <<< "obase=16; 255"         # decimal to hex: 255 -> FF
bc <<< "ibase=16; FF"          # hex to decimal: FF -> 255

# exponent
echo "10^2" | bc               # 100

# variables
echo "var=5;--var"| bc   # 4

# add list of numbers
(one number per line, no blank lines) | paste -sd+ - | bc   # add list of numbers 


```



# see also

- expr    # don't have this yet
