





# types

```toml
# strings
.field = "a"                            # literal
.message = downcase(string!(.message))  # lowercase

# arrays
.array[1] = "Hello, World!"             #

# objects
doc = {"a": "b"}                        # literal 
doc |= {"c": "d"}                       # merge

# type coercion
.timestamp = parse_timestamp(.timestamp, "%Y/%m/%d %H:%M:%S %z") ?? now()
.pid = to_int!(.pid)
.tid = to_int!(.tid)
```



# assignment

```toml
# operators
=                                       # set (overwrite)
|=                                      # merge


field = "a"                             # set variable
.field = "a"                            # set context doc field
.timestamp = now()                      # add field to context doc
.parent.child = "Hello, World!"         # nested assignment
.first = .second = "Hello, World!"      # multi assignment
```

# json

```toml
. = parse_json!(string!(.message))      # parse raw json 
```

# regex

- Rustexp Regex Tester: https://rustexp.lpil.uk/ 

```toml

(?i)                              # case insensitive
(?m)                              # multiline mode
(?s)                              # . matches \n
(?x)                              # ignore whitespace
(?P<name>regex)                   # named capture

. |= parse_regex!(.message, r'^(?P<timestamp>\d+/\d+/\d+ \d+:\d+:\d+ \+\d+) \[(?P<severity>\w+)\] (?P<pid>\d+)#(?P<tid>\d+):(?: \*(?P<connid>\d+))? (?P<message>.*)$')
```

# timestamp

```toml
now()                                                      #
timezone = "US/Eastern"                                    # set timezone global var for time functions
t'2021-02-11T10:32:50.553Z'                                # timestamp literal (RFC3339)
.timestamp = now()                                         # add current timestamp
.timestamp = to_unix_timestamp(to_timestamp!(.timestamp))  # timestamp convert to unix
parse_timestamp!("10-Oct-2020 16:00+00:00", format: "%v %R %:z")
```

