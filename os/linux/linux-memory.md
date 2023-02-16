

Free

    

# cheatsheet

```bash
cat /proc/meminfo
cat /proc/meminfo | grep MemTotal | awk '{ printf("%.2f MB\n", $2/1000) }'   # total (MB)
cat /proc/meminfo | grep MemFree  | awk '{ printf("%.2f MB\n", $2/1000) }'   # free (MB)
```
