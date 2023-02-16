# modern alternatives

```bash
# see 
unix/modern/dust
```

# one-liners (mac)

```bash
# all examples use depth of 1
du -hd1                         # human readable units (not sortable)
du -kd1                         # kiB units
du -kd1 | sort -nr              # kiB units, sorted
du -md1                         # MiB units
du -md1 | sort -nr              # MiB units, sorted
du -md1 | sort -nr | head -10   # MiB units, sorted, top 10
du -gd1                         # GiB units
du -md1 | sort -nr              # GiB units, sorted*
du -md1 | sort -nr | head -10   # GiB units, sorted*, top 10 
                                # * NOTE that GiB sort is inaccurate if < 1GB
```

