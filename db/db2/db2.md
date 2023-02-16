





```sql

# db2
WHERE bd.LastModified >= TIMESTAMP_FORMAT(REPLACE(REPLACE(?, 'T', ' '), 'Z', ''), 'YYYY-MM-DD HH24:MI:SS.FF3')
  AND bd.LastModified <= TIMESTAMP_FORMAT(REPLACE(REPLACE(?, 'T', ' '), 'Z', ''), 'YYYY-MM-DD HH24:MI:SS.FF3')


```

