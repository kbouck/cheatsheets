

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

# Create the parser
my_parser = argparse.ArgumentParser(description='List the content of a folder')

# Add the arguments
my_parser.add_argument('path',
                       metavar='path',
                       type=str,
                       help='the path to list')

# Execute the parse_args() method
args = my_parser.parse_args()

# access args
input_path = args.path

# test if arg was set
if (args.path is None):
  ...

if not os.path.isdir(input_path):
    print('The path specified does not exist')
    sys.exit()
```


```python

# name program
my_parser = argparse.ArgumentParser(prog='myls',
                                    description='List the content of a folder')

# custom help
my_parser = argparse.ArgumentParser(prog='myls',
                                    usage='%(prog)s [options] path',
                                    description='List the content of a folder'

```

