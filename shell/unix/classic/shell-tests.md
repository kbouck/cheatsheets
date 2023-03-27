

# forms

```bash 
if test $USER = 'abc'             # test form
if [ $USER = 'abc' ]              # bracket form
(( t = a<45?7:11 ))               # double-paren form
[[ $b = 5 ]] && a="$c" || a="$d"  # ternary

# todo - need to describe diff between [ ] and [[ ]]
# lots of details here:
# http://mywiki.wooledge.org/BashFAQ/031
```

# boolean

```bash
!   # not
-a  # and
-o  # or
```

# strings

```bash
[ $str1 = $str2 ]    # equal
[ $str1 != $str2 ]   # not equal
[ -z $str ]          # length is zero
[ -n $str ]          # length is non-zero
```

# numbers

```bash
[ $num1 -eq $num2 ]  # equal
[ $num1 -ne $num2 ]  # not equal
[ $num1 -gt $num2 ]  # greater-than
[ $num1 -ge $num2 ]  # greater-or-equal
[ $num1 -lt $num2 ]  # less-than
[ $num1 -le $num2 ]  # less-or-equal
```


# arrays

```bash
[ " ${array[@]} " =~ " ${value} " ]   # value is a member of array
```

# files

```bash
[ -e $file ]           # exists 
[ -r $file ]           # exists and readable
[ -w $file ]           # exists and writable
[ -x $file ]           # exists and executable
[ -f $file ]           # exists and is file (not dir or device)
[ -d $file ]           # exists and is directory 
[ -s $file ]           # exists and size > 0
[ -b $file ]           # is block device
[ -c $file ]           # is character device
[ -p $file ]           # is pipe
[ -h $file ]           # is symbolic link
[ -S $file ]           # is a socket
[ -t 0 ]               # stdin is a terminal
[ -t 1 ]               # stderr is a terminal   
                       # todo - what about stdout?  check if 0, 1 above are correct
[ $file1 -nt $file2 ]  # newer than
[ $file1 -ot $file2 ]  # older than
[ $file1 -eg $file2 ]  # hard links to same file 
[ -N $file ]           # file modified since last read

# test if command exists (irrespective of location)
# TODO - these don't work with zsh as output of type is more than just command location :-(
if ! type "$command_name" > /dev/null; then ...
if ! command_location="$(type -p "$command_name")" || [[ -z $command_location ]]; then ...
```

# test and exit

```bash
[[ $(id -u) -eq 0 ]] || { echo >&2 "Must be root to run script"; exit 1; }
[[ $date_to  =~ $date_regex ]] || { echo "ERROR: date_to not in yyyy-MM-dd format"; exit -1; }
```

# special

## program/command exists

POSIX-compatible method:

```bash
command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
```

To check built-ins and keywords:

```bash
type foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
```

For regular commands:

```bash
hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
```







