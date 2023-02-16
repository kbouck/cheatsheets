
# TODO 
lots of goodies here:
https://raimonster.com/scripting-field-guide/

# read lines

```bash
# read lines from stdin
while read line; do echo "$line"; done < /dev/stdin

# read lines from file
while read line; do echo "$line"; done < file
cat file | while read line; do echo ${line}; done

# read lines from stdin or file
# NOTE: ${1:-x} is a variable expansion fall back to the string 'x' if $1 is  otherwise empty (or unset?).
file=$1                  
while read line; do echo "$line"; done < "${file:-/dev/stdin}"


# read lines from file into bash array
# from https://stackoverflow.com/questions/11393817/read-lines-from-a-file-into-a-bash-array
IFS=$'\r\n' GLOBIGNORE='*' command eval 'array=($(cat $file))'


# peek at next line in stdin
IFS= read -r line
if [[ -n "$line" ]]; then
    # the line is non-empty.
    # add the line back into the stream and pipe it into your program
    { echo "$line"; cat -; } | your_program
fi
```

# redirection

- The result of << or <<< becomes stdin for the command
- style notes from: https://wiki.bash-hackers.org/howto/redirection_tutorial

  - ***Always*** keep redirections "tightly grouped" – that is, do not include whitespace anywhere within the redirection syntax except within quotes if required on the RHS (e.g. a filename that contains a space). Since shells fundamentally use whitespace to delimit fields in general, it is visually much clearer for each redirection to be separated by whitespace, but grouped in chunks that contain no unnecessary whitespace.

  - ***Do*** always put a space between each redirection, and between the argument list and the first redirect.

  - ***Always*** place redirections together at the very end of a command after all arguments. Never precede a command with a redirect. Never put a redirect in the middle of the arguments.

  - **Never** use the csh `&>foo` and `>&foo` shorthand redirects. Use the long form `>foo 2>&1`.

```bash
# stdin, stdout, stderr
# =====================
0            # stdin file descriptor
1            # stdout file descriptor
2            # stderr file descriptor
> file       # redirect stdout to file
1> file      # redirect stdout to file
2> file      # redirect stderr to file
>> file      # redirect and append stdout to file
2>> file     # redirect and append stderr to file
&>           # ! DONT USE - redirect stderr to stdout (bad style)
tgt>&src     # redirect src to tgt (where src/tgt are numeric)
2>&1         # redirect stderr to stdout
1>&2         # redirect stdout to stderr
> /dev/null 2>&1  # redirect stdout and stderr to /dev/null

-            # temp file from stdin (only works with some commands)

>file 2>&1   # redirect stderr and stdout to file
2>&1 >file   # ! DON'T USE - wrong order, won't work

echo "msg" 1>&2  # echo "msg" to stderr

<file        # redirect file to stdin

# process substitution
# ====================
<(cmd...)    # create temp/psuedo file descriptor from command output

```

# exec

- Normally exec replaces the shell with the specified program
- However, if you don't specify a program, the redirection after exec modifies the file descriptors of the current shell.

```bash
exec 2> script_errors.log  # redirect script errors to log


# logging example
exec 3>&1         # Copy 1 into 3
exec 1> logfile   # Make 1 opened to write to logfile
lotsa_stdout      # Outputs to fd 1, which writes to logfile
exec 1>&3         # Copy 3 back into 1
```



# script dir

```bash
# one-liner to get script dir
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

```



# temp files

```bash
tmpfile=$(mktemp /tmp/abc-script.XXXXXX)
...
rm "$tmpfile"
```

# errors

Ref: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

```bash
# please "set -e" and ideally "-euo pipefail" in shell scripts, because encountering an error and defaulting to "this is fine" is not good for many scripts

set -e              # exit if a command returns non-zero return code
set -E              # TODO - see https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -u              # exit if an unset variable is accessed
set -o pipefail     # exit if a pipeline command returns non-zero return code
set -euo pipefail   # set all of these options

some_cmd || true    # supress immediate exit for a command 

```

# references

https://wiki.bash-hackers.org/howto/redirection_tutorial
