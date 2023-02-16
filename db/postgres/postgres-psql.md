# psql

```bash
-U <user>                         # user (default: current user)
-h <host>                         # hostname (default: localhost)
-d <db>, --dbname=<db>            # database name
-c <cmd>, --command=<cmd>         # run single sql or internal command
-f <cmd-file>, --file=<cmd-file>  # run commands from file

# commands
\c                                # view currently connected db
\c <db-name>                      # connect to db
\c -h <host>                      # connect to db on another host
\c -h <host> -U <user>            # connect to db on another host as user
\l                                # list databases
\d                                # list tables and other stuff
\d <table-name>                   # describe table
\d+ <table-name>                   
\dt                               # list tables
\di                               # list indexes
\dm                               # list materialized views
\dn                               # list schemas

# misc
\crosstabview [ colV [ colH [ colD [ sortcolH ] ] ] ]


# query buffer
\e[dit]                           # edit current query (end with \; to suppress execution)
\p[rint]                          # print current query
\r[eset]                          # reset current query
\w[rite] <filename>               # write current query to file
\g                                # send current query
\g <filename>                     # send current query, write output to file
\s                                # command query history
```



```bash
# pass sql as here-doc
psql <<END_OF_SQL
  CREATE TABLE foo (x integer);
  INSERT INTO foo VALUES (42);
  SELECT * FROM foo;
  DROP TABLE foo;
  END_OF_SQL
```

# csv

```bash
# psql, interactive shell
\copy table from 'file.csv' csv header;
\copy table(field1, field2, field3, ...) FROM 'file.csv' DELIMITER ',' CSV HEADER;

# psql, command-line
psql -c "\copy <table-name> FROM 'file.csv' delimiter '|' csv header;"
```

# 
