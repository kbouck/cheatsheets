# sys.argv

```python
import sys

if len(sys.argv) > 2:
    print('You have specified too many arguments')
    sys.exit()
```


# argparse

```python
import argparse

# initialize arg parser
parser = argparse.ArgumentParser(prog='myls', usage="...", description='program description')

# define args
parser.add_argument('path', metavar='path', type=str, help='the path to list')
parser.add_argument('--input', type=str, required=True, help='Input file name')
parser.add_argument('--output', type=str, required=True, help='Output file name')
parser.add_argument('--verbose', action='store_true', help='Enable verbose mode')

# parse args
args = parser.parse_args()

# validate args
if (args.path is None):
  ...

if not os.path.isdir(input_path):
    print('The path specified does not exist')
    sys.exit()
    
# access args
input_path = args.path  
input_file = args.input
output_file = args.output
verbose = args.verbose
```

