



# log stream selector

```protobuf
{app="mysql", name="mysql-backup"}
```

# line filter expressions

```bash
|=: Log line contains string
!=: Log line does not contain string
|~: Log line contains a match to the regular expression
!~: Log line does not contain a match to the regular expression
```


```bash
|= "error"                               # keep
!= "kafka.server:type=ReplicaManager"    # dicard
```

# label filter expressions

```bash





```

