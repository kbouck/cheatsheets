

https://datastation.multiprocess.io/blog/2022-01-11-dsq.html


```bash

$ cat users.csv
name,age
Jorge,30
Nina,32
Cal,28
Mona,27

$ cat ids.json
[
  {"id": 1, "name": "Jorge"},
  {"id": 2, "name": "Mona"},
  {"id": 3, "name": "Cal"},
  {"id": 4, "name": "Nina"}
]


# select

$ dsq users.csv "SELECT * FROM {} ORDER BY CAST(age AS INT) DESC"

# join csv and json

$ dsq users.csv ids.json "SELECT id, {0}.name FROM {0} JOIN {1} ON {0}.name = {1}.name"



```