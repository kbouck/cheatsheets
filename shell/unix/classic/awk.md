

# one-liners

```bash
# fields
awk 'print $1'     # print field 1
awk '{ print substr($1,0,4) }'  # substring of field

# lines
awk 'NF>0'         # skip blank lines
awk 'NR>2'         # skip first 2 lines
awk 'c&&!--c;/some_regex/{c=46}' sii_onesap_202111*.xml  # print nth line after match

# math
awk '{ total += $1; n++ } END { print total/n }'  # average a field
awk '{ total += $1 } END { print total }'         # sum a field

# I/O
awk '{ print $1; fflush() }'    # flush output (avoid buffering)
awk -W interactive              # does this also avoid buffering? 
```

# anatomy

```bash
BEGIN {actions}                    # run once before input data is read
/pattern or condition/ {actions}   # run for each line of input
END {actions}                      # run once after input data is finished
```



## patterns




## actions



# string/text functions

```bash
length               # length of $0
length(str)          # string length
length(array)        # number of elements in an array

int(str/float)       # convert to integer. floats truncated.
strtonum(str)        # convert string to number. Can do hex->dec (eg. "0xFF" => 255)
substr(str,off,len)  # substring (offset is 1-based)
index(str,substr)    # index of substr in str, or 0 if not found.
match(str,regex)     # index of regex in str, or 0 if not found.  
                     # note: variables RSTART and RLENGTH are set to 
                     #       the position and length of the matched string.
                     #       so use in combination with substr to capture strings

split(str,arr)       # split str by FS into array a[0]..a[n], and return n.
split(str,arr[,fs])  # split str by fs into array a[0]..a[n], and return n.  
split(str,arr,"")    # split str chars into array a[0]..a[n], and return n.

sub(regex,new)       # sub new for first occurrence of regex in $0, return # replacements.
sub(regex,new,str)   # sub new for first occurrence of regex in str, return # replacements.
gsub(regex,new,str)  # sub new for all occurences of regex in str, return # replacements.

sprintf(fmt,expr,..) # return formatted string

system(cmd)          # execute cmd, return exit status

tolower(str)         # return lower-case copy of str
toupper(str)         # return upper-case copy of str

fflush()             # flush output (avoid buffering)
```

# math functions

```bash
rand          # random number on (0,1)
srand         # sets seed for rand and returns the previous seed.
exp(x)        # natural exponent. e^x
log(x)        # natural log: ln(x) or log_e(x) -- not "common log" log_10(x) 
sqrt(x)       # square root
sin(x)        # sine
cos(x)        # cosine
atan2(x)      # tangent
```



# misc functions

```bash
# execute system command
system("gmetric -t uint16 -u Celsius" " -n " temp " -v " temps[temp]);

# TODO - possible to use with curl to dynamically construct 
```



# arrays

```bash
index in array        # test for existence
delete some_array[0]  # declare an empty array

PROCINFO["sorted_in"] = "@(ind|val)(num|str|type)(asc|desc)" # control array traversal order
@unsorted
@ind_str_asc
@ind_str_desc
@ind_num_asc
@ind_num_desc
@ind_type_asc
@ind_type_desc
@val_str_asc
@val_str_desc
@val_num_asc
@val_num_desc
@val_type_asc
@val_type_desc
```

# loops

```
while( expression ) statement
for( expression ; expression ; expression ) statement
for( var in array ) statement
do statement while( expression )
break
continue
```




# fields

Fields are (by default) separated by white space. This line

    00:34:23   GET   /foo/bar.html

would be parsed into these fields:

```bash
$0 == "00:34:23   GET   /foo/bar.html"
$1 == "00:34:23"
$2 == "GET"
$3 == "/foo/bar.html"
```


## field separator

set field separator
```bash
awk -F " "
awk 'BEGIN { FS="," }' 
```

## reorder fields

```bash
awk '{ print $2,$1 }'
```



# Program Files

## run program file

```bash
awk -f <prog-file>	
```


## program file structure

Every line of input is run over every one of the script lines:

```bash
# comment
Pattern1 { ACTIONS; }

# comment
Pattern2 { ACTIONS; }

# comment
Pattern3 { ACTIONS; }

# comment
Pattern4 { ACTIONS; }
```



# CSV

reference:

https://stackoverflow.com/questions/45420535/whats-the-most-robust-way-to-efficiently-parse-csv-using-awk

```bash
# one-liners
# - works for simple csv, but misses a number of edge cases with csv
awk -v FPAT='([^,]*)|("[^"]*")'
alias awkcsv='awk -v FPAT="([^,]+)|(\"[^\"]+\")"'


# program file 
BEGIN {
  FS=,                          # simple csv
  FPAT="([^,]*)|(\"[^\"]*\")"   # (gawk-only?) quoted csv (does not handle newlines in data)
}
```



# Fixed Width

```bash
BEGIN { FIELDWIDTHS = "9 6 10 6 7 7 35" }  # gawk-only
```



# JSON

```
Pre-process using (jq|miller|csvkit) to convert from json to csv or tabular, then process in awk.
```




# options

```bash
-f <progfile>        # run program file
--file=<progfile>    # run program file

-v <var>=<value>     # set variable
--assign=var=<value> 

-F <regex>, 
--field-separator=<regex>  # field separator regex

-W interactive       # interactive, suppress buffering
```




# special variables

```bash
FS               # regex field separator (really regex? seems like substr)
FPAT             # regex field separator pattern - only gawk?
NF               # number of fields in current record
NR               # current record number
FNR              # ?
FILENAME         # current input filename
RS               # input record separator (default: newline)
OFS              # output field separator (default: blank)
ORS              # output record separator (default: newline)
OFMT             # output number format (default: %.6g)
SUBSEP           # ?
ARGC             # argument count
ARGV             # argument array, non-null members taken as filenames
ENVIRON          # array of env vars


# TODO cleanup after here

/
BEGIN { # Can be modified by the user
  FS = ",";                           # Field Separator
  RS = "\n";                          # Record Separator (lines)
  OFS = " ";                          # Output Field Separator
  ORS = "\n";                         # Output Record Separator (lines)
  FPAT = "([^,]+)|(\"[^\"]+\")"       # (gawk-only) Field pattern (this example handles csv with double quotes). 
                                      # Regexplanation:
                                      #   "anything that is not a comma" or "double quote, 
                                      #   followed by anything that is not a comma, 
                                      #   followed by a closing double quote"
}
{ # Can't be modified by the user
  NF                                  # Number of Fields in the current Record (line)
  NR                                  # Number of Records seen so far
  ARGV / ARGC                         # Script Arguments
}
```





## interactive (no buffering)

```bash
awk -W interactive
```



# State Machine

sample input with section headers, followed by temp readings in each section

```awk
radeon-pci-0100
Adapter: PCI adapter
temp1:        +50.5°C  (crit = +120.0°C,
                        hyst = +90.0°C)

k10temp-pci-00c3
Adapter: PCI adapter
temp1:        +36.8°C  (high = +70.0°C)
                       (crit = +80.0°C,
                        hyst = +78.0°C)

f71889ed-isa-0480
Adapter: ISA adapter
+3.3V:        +3.23 V
in1:          +1.07 V  (max =  +2.04 V)
in2:          +1.09 V
in3:          +0.89 V
in4:          +0.58 V
in5:          +1.23 V
in6:          +1.53 V
3VSB:         +3.25 V
Vbat:         +3.31 V
fan1:        3978 RPM
fan2:           0 RPM  ALARM
fan3:           0 RPM  ALARM
temp1:        +31.0°C  (high = +85.0°C,
                        hyst = +81.0°C)
                       (crit = +80.0°C,
                        hyst = +76.0°C)
                        sensor = transistor
temp2:        +43.0°C  (high = +85.0°C,
                        hyst = +77.0°C)
                       (crit = +100.0°C,
                        hyst = +92.0°C)
                        sensor = thermistor
temp3:        +38.0°C  (high = +70.0°C,
                        hyst = +68.0°C)
                       (crit = +85.0°C,
                        hyst = +83.0°C)
                        sensor = transistor
```



- parsing strategy is to maintain a current section variable to use when categorizing the subsequent temperature values

```bash
#!/usr/bin/awk -f

BEGIN {
    # Which section do we start the script in?
    unit = "none";
}

/^radeon-pci-/ {
    # Encountered the GPU section header
    unit = "GPU";
}

/^k10temp-pci-/ {
    # Encountered the CPU section header
    unit = "CPU";
}

/^f71889ed-isa-/ {
    # I don't know what this is, actually, so
    # I'm just going to call them SYS_1 etc.
    unit = "SYS";
}

/^temp[0-9]:/ {
    # Yay, a temperature reading!
    # Which number does this reading have?
    number = substr($1, 5, 1);

    # Which temperature is given?
    match($2, /+([0-9.]+)°C/, matches);
    temp = substr(
        $2,
        matches[1, "start"],
        matches[1, "length"]
    );

    # Store the results in an array
    temps[unit "_" number] = temp;
}

END {
    # Call gmetric for all temperatures found
    for (temp in temps) {
        system(
            "gmetric -t uint16 -u Celsius"
            " -n " temp " -v " temps[temp]
        );
    }
}
```



# References

- https://ferd.ca/awk-in-20-minutes.html
- https://github.com/learnbyexample/Command-line-text-processing/blob/master/gnu_awk.md
- http://blog.jpalardy.com/posts/why-learn-awk/
- http://blog.jpalardy.com/posts/awk-tutorial-part-1/
- http://blog.jpalardy.com/posts/awk-tutorial-part-2/
- http://blog.jpalardy.com/posts/awk-tutorial-part-3/
- https://ia802309.us.archive.org/25/items/pdfy-MgN0H1joIoDVoIC7/The_AWK_Programming_Language.pdf







