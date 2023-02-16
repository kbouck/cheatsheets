


## options

```bash
-n <priority>     -20 (highest) to 20 (lowest). Only super-user can use <0 (default: 10)
```

## execute command w/ low priority
```bash
nice -n 19 tar -czvf big.tgz large_dir
```


