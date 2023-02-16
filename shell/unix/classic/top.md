

xargs converts stdin to literal args


# examples

```bash
-o pid        # sort by pid
-o cpu        # sort by cpu%
-o mem        # sort by mem
-o command    # sort by command name
-o time       # sort by cumulative cpu time

-s <seconds>  # seconds between refresh
-l <count>
-n <n>        # show only top n processes
```



troubleshooting

```bash
# get cpu for single pid
ps -p <pid> 


```

