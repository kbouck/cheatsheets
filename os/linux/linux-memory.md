

Free

​    

# cheatsheet

```bash
cat /proc/meminfo
cat /proc/meminfo | grep Mem                         # total + available + free
cat /proc/meminfo | grep MemTotal                    # total
cat /proc/meminfo | grep MemAvailable                # available
cat /proc/meminfo | grep MemFree                     # free

# get memory metrics in MB
cat /proc/meminfo | grep MemTotal | awk '{ printf("%.2f MB\n", $2/1000) }'   # total (MB)
cat /proc/meminfo | grep MemFree  | awk '{ printf("%.2f MB\n", $2/1000) }'   # free (MB)
```
