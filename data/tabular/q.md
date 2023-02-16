SQL queries using tabular data files as tables

http://harelba.github.io/q/

# install

```bash
brew install harelba/q/q
```


# options

```bash
-d <delimiter>            # input delimeter (default: whitespace?)
-H                        # file contains header
-C <read, readwrite>      # use cache
```

# one-liners

```bash
q "select c1,c5 from myfile.csv"     # select columns by index: 1,5

# Setting the default caching mode (`-C`) can be done by writing a `~/.qrc` file
```


# sqlite 

```bash
q "select * from mydatabase.sqlite:::my_table_name"

# or

q "select * from mydatabase.sqlite"

# if the database file contains only one table
# sqlite files are autodetected, no need for any special filename extension
```

