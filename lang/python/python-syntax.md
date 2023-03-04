# collections

only 4 collection types:

- set
  - set ops (union, intersect)
  - fast access vs lists
- list
  - general purpose / widely used
  - expandable
  - sortable
- tuple
  - immutable, faster than list
- dict

|           | mutable | ordered | index/slice | duplicates |
| --------- | :-----: | :-----: | :---------: | :--------: |
| **set**   |    X    |         |             |            |
| **list**  |    X    |    X    |      X      |     X      |
| **tuple** |         |    X    |      X      |     X      |



```python
# general
type(v)                                  # get return type of a variable

```

# tuple

```python

# tuple
t = ()                                   # empty tuple
t = ("a", "b", "c")                      # inline

```

# set

```python
s = set()                                # empty set ( {} creates a dict )
s = {"a", "b", "c"}                      # inline
s.add("a")                               # add
for i in s:                              # iterate over
l = list(s)                              # set to list
s = set(l)                               # set from list

# functions
add
clear
pop
union
issuperset
issubset
intersection
difference
isdisjoint
setdiscard
copy
```

# list

```python
l = []                                   # empty list
l = [1, 2, 3]                            # 
s = set(l)                               # list to set
l = list(s)                              # list from set    

# functions
append
copy
count
insert
reversed
removed
sort
pop
extend
index
clear
```

# dictionary

```python
# construction
d = {}                                   # empty dictionary
d = {                                    # inline
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
}

# test 
if "key1" in d:                      # test for dict membership

# access
d['key']['subjey']

# functions
copy
clear
fromkeys
items
get
keys
pop
values
update
setdefault
popitem

```

# functions

```python

# named arguments
def frobnicate(*, timeout_seconds: int) -> None:
    # The * forces the caller to use named arguments
    # for all arguments after the *
```


# callbacks

```python
def my_callback(num):
    print("function my_callback was called with ", num)

def caller(val, cb):
    cb(val)

caller(5, my_callback)
caller(10, my_callback)
```





