todo:
- https://github.com/onceupon/Bash-Oneliner

## one-liners

```bash
sed '/^$/d'              # delete blank lines
sed 's/\#.*$//g'         # delete comments (prefixed with #) from lines 
sed 's/^0+//'            # strip leading 0's 
sed '1d'                 # delete first line
sed '1,3d'               # delete first 3 lines
sed '5q;d'               # output only 5th line
sed '<n>q;d'             # output only n-th line
sed '/^hello/ s/h/H/'    # on lines matching 1st regex, replace 2nd regex with substitution 
sed '/^hello/c replaced' # on lines matching 1st regex, replace entire line with substitution
sed '1 s/^/year/'        # insert text at beginning of first line only
sed 's/(.)/\1\n/g'       # newline after every char
```



## command anatomy

```
sed -n '5,9p/old/new/g' file.txt
     |  |  || |   |  |   |
     |  |  || |   |  |   input file 
     |  |  || |   |  modifier (g: all occurences)
     |  |  || |   |
     |  |  || |   replacement
     |  |  || |
     |  |  || search regex
     |  |  ||
     |  |  |delimeter: "/"
     |  |  |
     |  |  command (p: print)
     |  |
     |  address/range (lines 5-9, inclusive)
     |
     flags (-n: no print)
```



## flags

```bash
-n   # no print
-e   # multiple ops
-f   # read from file
-i   # edit in place
-u   # unbuffered output (linux I think)
-E   # Interpret extended (modern) regex expressions
```



## address range

```bash
sed 's/old/new/'     # no address. address all lines
sed -n '5,9p'        # print only lines 5-9
sed -n '3p'          # print only line 3
sed -n '$p'          # print only last line
sed -n '5,$p'        # print only lines 5-last
sed '1,3d'           # delete first 3 lines
sed '2,$s/old/new/'  # perform substitution only on lines 2-last
```



## commands

```bash
s    # substitute
y    # transliterate (like tr - replace chars in str1 with corresponding char in str2)
p    # print
d    # delete
a    # append
i    # insert
c    # replace line (?)
q    # quit
```



## delimiters

delimeter is set as the char succeeding command

```bash
sed 's|old|new|'
sed 's:old:new:'
sed 's,old,new,'
```



## modifiers

```bash
n    # apply to nth occurrence
g    # apply to all occurrences
```



## capture groups

```bash
sed 's/abc(.*)xyz/\0/'      # linux
sed 's/abc(.*)xyz/\1/'      # macos
```



