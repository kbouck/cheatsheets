



# start, stop, restart, status

```bash
# ubuntu
sudo service postgresql status
sudo service postgresql start
sudo service postgresql stop
sudo service postgresql restart

# Postgres.App
- open from menubar, stop, start
```

# user mgmt

```bash
sudo su - postgres
createuser --interactive --pwprompt <user-name>

# password
sudo -u postgres psql
# -or-
\password
```

# db mgmt

```sql
CREATE DATABASE <db-name>;          # create database
psql# \c <db-name>                  # connect to database
select current_database();          # view currently connected database
```

# table mgmt

```sql
DROP TABLE <db-name> CASCADE;
```

# config files

```bash
 /etc/postgresql/<major-version>/main/postgresql.conf               # 
 /etc/postgresql/<major-version>/main/pg_hba.conf                   #
```



listen to all interfaces

```bash
# pg_hba.conf 
host    all             all             0.0.0.0/0            md5  # ipv4
host    all             all             ::/0                 md5  # ipv6

# postgresql.conf
listen_addresses = '*'

# then run (as superuser)
SELECT pg_reload_conf();

```





# Postgress.App

```bash
postgresql://localhost
port: 5432
user: <same as login>
pass: <none>




```





# json

https://www.postgresql.org/docs/9.5/functions-json.html





## ~ regex

```sql
~             -- regex operator
~~            -- LIKE operator
```

```sql
select * 
from transactions_abn_personal_2020 txn
left join regex r on txn.desc ~ r.regex 
```



## ~~ LIKE operator

```sql
-- INNER
-- LEFT
-- RIGHT
-- FULL 
```

### regex operator

```sql

```



```sql
select 
txn.*, 
coalesce(r.category, term.category, i.category) as category,
coalesce(r.subcategory, term.subcategory, i.subcategory) as subcategory,
r.regex as "r_regex",
r.category as "r_category", 
r.subcategory as "r_subcategory",
term.category as "term_category",
term.subcategory as "term_subcategory",
i.category as "i_category",
i.subcategory as "i_subcategory"
from transactions_abn_personal_2020 txn
left join regex r on txn.desc ~ r.regex 
left join terminals_latest term on txn.terminal_id = term.terminal
left join iban i on txn.recv_iban = i.iban
```



## filtering categories file

```bash
cat categories_by_iban.txt | sed 's/\#.*$//g' | grep -Ev '^\s*$' | in2csv -f fixed -s categories_by_iban_schema.json 
```





# view vs. materialized view

- view: saved query
- materialized view: saved query results

```sql
-- create
CREATE MATERIALIZED VIEW view_name
AS
query
WITH [NO] DATA;


-- refresh
-- must be called manually - like after each update
REFRESH MATERIALIZED VIEW [ CONCURRENTLY ] name


-- drop
DROP MATERIALIZED VIEW view_name;

```

