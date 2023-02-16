
# one-liners 

```bash
split        # split every 1000 lines 
split -l3    # split every 3 lines 
split -b1000 # split every 1000 bytes
split -b10K  # split every 10 KiB (1024)
split -b10KB # split every 10 KB (1000)
split -b10M  # split every 10 MiB (1024x1024)
split -b10MB # split every 10 MB (1000x1000)
split -C     # like -b but tries to split on line breaks.
split -n2    # split into 2 similarly sized chunks 

```
