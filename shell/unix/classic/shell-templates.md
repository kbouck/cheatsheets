


# main

fail-fast script options
https://dougrichardson.us/notes/fail-fast-bash-scripting.html

```bash
#!/usr/bin/env bash
set -eEuo pipefail
shopt -s inherit_errexit

main() {
  parse_args
  validate_args
  do_things
  cleanup
}

main "$@"

```

# help

```bash
print_usage() {

    echo "my-script — does one thing well
    
Usage:
    my-script <input> <output>
    
Options:
    <input>   Input file to read.
    <output>  Output file to write. Use '-' for stdout.
    -h        Show this message.
"
}
```

# options

check out https://argbash.dev

## read

```bash
$ echo 'one two three' | read -r a b c
$ echo "$a $b $c"
```


## with getopt

(util-linux, handles long args)


## with getopts

other examples: 
https://bashplate.wolfgang-werner.net

```bash
while getopts ":ht" opt; do
  case ${opt} in
    h ) # process option a
      ;;
    t ) # process option t
      ;;
    \? ) echo "Usage: cmd [-h] [-t]"
      ;;
  esac
done


# getopts with args
while getopts ":t:" opt; do
  case ${opt} in
    t )
      target=$OPTARG
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))   
```



## without getops

```bash
while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            do_help
            exit
            ;;
        -v|--version)
            do_version
            exit
            ;;
        -d|--debug)
            debug=true
            shift
            ;;
        -a|--arg)
            arg_value=$2
            shift 2
            ;;
    esac
 done
```

