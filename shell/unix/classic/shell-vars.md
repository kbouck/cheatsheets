
more tricks at

https://raimonster.com/scripting-field-guide/



# environment variables

```bash
# set for local/session scope
var=value
export var=value

# set for one command
todo

# set for all future commands in this shell
todo

# unset
uset <var>

# source
todo
```

# local variables

- https://raimonster.com/scripting-field-guide/#org055cd1f
- By default variables are global, to a file. No matter if you assign them for the first time inside a function, or at the top level. 
- You make a variable local to a function with local. Use it as much as you can (kinda obvious).

```bash
myfun() {
  local bar
  bar=3
  echo $bar
}
```

# variable substitution 

- https://github.com/onceupon/Bash-Oneliner

```bash
echo "'$foo'"     # substitution w/in 's

```


# variable expansions

- https://raimonster.com/scripting-field-guide/#orge4d0aa7

- https://github.com/onceupon/Bash-Oneliner

```bash
# string truncation
${a:offset}          # substring from offset to end
${a:offset:length}   # substring from offset to offset+length
${a:offset:-length}  # substring from offset to end-length
${a:-offset:-length} # substring from end-offset to end-length
${a:0:1}             # first char
${a:2}               # remove first string

# string modification
${a/old/new}         # replace first occurrence 
${a//old/new}        # replace all occurrences
${a/#old/new}        # replace from beginning to (like regex ^)
${a/%old/new}        # replace from end (like regex $)
${a/old/}            # delete first occurrence
${a//old/}           # delete all occurrences
${a/#old/}           # delete from beginning
${a/%old/}           # delete from end
${a/#/new}           # insert prefix
${a/%/new}           # insert suffix
${a^^}               # uppercase
${a,,}               # lowercase

${#a}                # string length

${a:-b}              # literal value 'b' if $a is unset or null
${a:=b}              # expansion of 'b' if $a is unset or null
${a:+b}              # expansion of 'b' if $a is not (unset or null)
${a:?b}              # message b written to stderr if $a is unset or null

${!a}                # variable indirection - access the variable named by value of a
```

# heredocs

- heredocs and herestrings are (possibly multiline) file or input stream literals
- The result of << or <<< becomes stdin for the command

```bash
# heredoc to stdout
cat << EOF
abc
def
EOF

# heredoc to stdout (w/o substitution)
# using 'EOF' behaves like single-quoting a string
cat << 'EOF'
abc
def
$(echo "not substituted")
EOF

# heredoc to stdout with leading tabs suppressed
# NOTE:
# - any leading tabs are suppressed
# - left indent must be tabs, not spaces
# - to insert a tab in vi, CTRL-V + TAB
cat <<- EOF
    abcd
    EOF

# heredoc to file (w/ substitution)
cat << EOF > file
abc
def
EOF

# ...or  (w/ substitution)
cat > file << EOF
abc
def
EOF

# heredoc to variable (w/ substition)
read -r -d '' variable_name << EOF
abc
def
$(echo "substituted")
EOF

# heredoc to variable (w/o substitution)
read -r -d '' variable_name << 'EOF'
abc
def
$(echo "not substituted")
EOF

# iterate over heredoc lines
while IFS= read -r line ; do echo $line; done <<< "${variable_name}"
```

# herestrings

- heredocs and herestrings are (possibly multiline) file or input stream literals
- The result of << or <<< becomes stdin for the command

```bash
# literal string to stdin
bc <<< "7.3 * 8.2"

# command output to stdin
<<< $(cmd...) # redirect stdout of command to stdin
              # TODO - how is this different from piping command?
```

# arrays

```bash
# assignment
a=( XXX YYY ZZZ ... )
a=([17]=seventeen [24]=twenty-four)   
a=( [0]="first element" )        # whitespace in values
dotfiles=(
  aliases.zsh
  config
  gitconfig
  gnupg
  irbrc
  tmux.conf
  tmux.overmind.conf
  zprofile
  zshrc
)

# assign array incrementally
declare -A a
a[hello]=world
a[ab]=cd

# assign array one-liner
# - taken from https://stackoverflow.com/questions/34536180/how-can-i-populate-an-associative-array-with-a-variable-name-in-bash)
# Note: The -g option forces variables to be created or modified at the global scope, even when declare is executed in a shell function.
declare -gA $name="( [foo]=bar [baz]=quux [corge]=grault )"

# extend array
a+=("new-element")




# reading lines from file into array
# from https://stackoverflow.com/questions/11393817/read-lines-from-a-file-into-a-bash-array
IFS=$'\r\n' GLOBIGNORE='*' command eval 'a=($(cat $file))'

# copy array a to b
b=( "${a[@]}" ) # copy array a to b

# access
${a[0]}         # array element 0 (key: 0)
${a:0}          # array element 0
${#a[*]}        # array size
${#a[@]}        # array size
${!a[@]}        # array keys
${a[@]}         # array values
myfun "${a[@]}" # pass array (values?) as a function argument

# iterate over array values
BACKUP_DIRS=(/etc /home/$USER /root /var/www)
for DIR in ${BACKUP_DIRS[@]}; do
  # should above have double-quotes around array var ?
  ...

# interate over array keys (and values)
a=( XXX YYY ZZZ ... )
for key in "${!a[@]}"; do
    echo "key  : $key"
    echo "value: ${a[$key]}"
done
```



# script dir

```bash
# get script dir (bash)
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
```



# reference

- https://www.gnu.org/software/bash/manual/html_node/
- https://raimonster.com/scripting-field-guide/
