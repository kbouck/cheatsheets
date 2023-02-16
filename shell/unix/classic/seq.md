


# cheatsheet
```bash
# anatomy
seq [options] [start] [step] <stop>

# integer sequences
seq        3   # 1..3
seq 1      3   # 1..3
seq 3 -1   1   # 3..1
seq 1  5 100   # 1, 5, 10, 15, ...100

# floating point sequences
seq 0.5     3   # 0.5, 1.5, 2.5
seq 1   0.5 3   # 1.0, 1.5, 2.0, 2.5

# strip leading zeros from input
seq 001 003  # 1, 2, 3 

# pad leading zeroes in output / equalize width
seq -w 8 10  # 08, 09, 10
seq -w 0003  # 0001, 0002, 0003

# number format
-f'%g'   1 0.75 3  # 1, 1.75, 2.5
-f'%.4f' 1 0.75 3  # 1.0000, 1.7500, 2.5000
-f'%.3e' 1.2e2 0.752 1.22e2  # 1.200e+02, 1.208e+02, 1.215e+02

# set output separator
-s' '      # output separated by space
-s','      # output separated by comma
-s', '     # output separated by comma-space
-s$'\n\n'  # output separated by 2 newlines

```
