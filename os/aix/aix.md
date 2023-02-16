


# memory
```bash
# List processes according to their virtual memory consumption
svmon -P -O unit=MB

# nicely formatted vmstat output
vmstat -lwt 1
```


# cpu

```bash
# top cpu-using processes, press "c" repeatedly to cycle through different cpu views
topas     # like top
topas -m  # monochrome

# nicely formatted vmstat output
vmstat -lwt 1

# CPU load
uptime
```


# process

```bash
# Per-therad CPU usage for a PID
ps -mT <pid> -o cpu,tid 
ps -mT <pid> -o cpu,tid | 
```



# disk

```bash
# du with depth, sorted 
du | grep -v '/.*/' | sort -nr
```


# misc

```bash
# Sort numerically:

jsvn list ${svn_modules}/an-dashboard/tags | sed 's/\///' | sort -t . -k 1,1n -k 2,2n -k 3,3n
```



