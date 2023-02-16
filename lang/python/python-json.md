# load

- https://docs.python.org/3/library/json.html#encoders-and-decoders

```python
import json

json.load                     # json stream to object 
json.loads                    # json string to oject

json_obj = json.loads(text)   # json text to object

cls=None
object_hook=None 
parse_float=None 
parse_int=None
parse_constant=None
object_pairs_hook=None
```

# dump

- https://docs.python.org/3/library/json.html#encoders-and-decoders

```python
import json

json.dump       # object to json stream
json.dumps      # object to json string

json.dumps(obj)                             # 
json.dumps(obj, sort_keys=True)             # sort by dictionary keys
json.dumps(obj, separators=None, 
json.dumps(obj, separators=(',', ':')       # compact (default: indent=None)
json.dumps(obj, indent=None)                # compact 
json.dumps(obj, indent=4)                   # pretty-print                     
json.dumps(obj, skipkeys=False)
json.dumps(obj, ensure_ascii=True)
json.dumps(obj, check_circular=True) 
json.dumps(obj, allow_nan=True) 
json.dumps(obj, cls=None)
json.dumps(obj, default=None)

```



# json.tool

- built-in json tool to pretty-print and validate json objects

```bash
python -m json.tool <options> [json-in-file] [json-out-file]

note:
    - if json-in-file or json-out-file not specified, 
      then sys.stdin and sys.stdout used respectively

options:
    --json-lines
    --indent, --tab, --no-indent, --compact
    --sort-keys
    --no-ensure-ascii
```

