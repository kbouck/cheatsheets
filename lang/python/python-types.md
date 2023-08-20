



# scalar

int, float, None, bool

```python
int                            # 
float                          #
None                           #
bool                           # True, Falst

# type casting
int()                          # cast to int
float()                        # cast to float
str()                          # cast to string
type(v)                        # return variable type
```



# collections

```python
# type    literal              mutable    ordered   index/slice   duplicates
# ====    =======              =======    =======   ===========   ==========
# list    ['a', 'b', 'c']         X          X           X            X
# tuple   ('a', 'b', 'c')                    X           X            X 
# set     {'a', 'b', 'c'}         X
# dict    {'key':'val', ...}      X        
```

## strings

- sequence of chars
- immutable

```python
'string'                      # string literal, single quotes
"string"                      # string literal, double quotes
'''multi-line 
   string'''                  # multi-line string literal, triple quotes
"""multi-line
   string"""                  # multi-line string literal, triple double-quotes
f'{value:2d}'                 # string-modifier: format (aka. "f-strings")
r'string'                     # string modifier: raw (ignore escape chars)
R'string'                     # string-modifier: raw (ignore escape chars)
u'string'                     # string-modifier: unicode (python 2.x)
b'string'                     # string-modifier: byte (python 3.x)


# access
len(str)                      # length of string
str[0]                        # char at index, relative to start
str[-1]                       # char at index, relative to end
str.split(" "[, max_split])   # split on separator

# format (f-strings)
f'{i:2d}'                     # decimal 
f'{i:2o}'                     # octal
f'{i:2X}'                     # hexadecimal
f'{i:10b}'                    # binary

# justification / alignment
str.ljust(width, fill_char)   # left-justify
str.rjust(width, fill_char)   # right-justify
str.center(width, fill_char)  # center

# modify
str.capitalize()              # 

# iterate
for c in "string":            # iterate over string chars
    
# string library
import string
string.ascii_lowercase
string.ascii_uppercase
```



## list

- general purpose / widely used, expandable, sortable

```python
# construct / copy / slice
l = []                                   # construct empty list
l = [1, 2, 3]                            # construct list from literal
l = range(3)                             # 0..2 
l = range(n,m)                           # n..m-1
l = range(n,m,<step>)                    # n..m-1, by <step>
l = list(s)                              # construct list from set  
l = list(str)                            # construct list from string
s = set(l)                               # construct set from list
l3 = l1 + l2                             # construct by concatenating lists
l2 = l[0:4]                              # construct from slice of elements 0-3
l2 = l[1:]                               # construct from slice of all elements but first
l2 = l[0:-1]                             # construct from slice of all elements but last
l2 = l[:2]                               # construct from slice of first two elements
l2 = l[:]                                # construct from slice of all elements (complete list copy)
l2 = [<expr> for i in <iter> if <cond>]  # construct from iterable using list comprehension

# access
len(l)                                   # length of list
l[0]                                     # first element in list         
l[-1]                                    # last element in list
l.index('element')                       # index of 'element' if found, else ...

# mutate
l.append('element')                      # append to end
l.insert(0, 'element')                   # insert at beginning
l.insert(5, 'element')                   # insert at 5th position
del l[5]                                 # delete 5th element
l.remove('element')                      # delete by value
l.pop()                                  # remove and return last element
l.pop(0)                                 # remove and return 0th element
l.sort()                                 # sort 
l.sort(reverse=True)                     # sort, reverse 
l.sort(key=str.lower)                    # sort, using sort key function
sorted(l)                                # return a new sorted list
l3 = l1 + l2                             # concatenate
['a','b','c'] * 2                        # relicate => [ 'a','b','c','a','b','c' ]
clear

# functions
count
reversed
removed
extend
index


# iterate
for element in l:                        # iterate over values
for element in reversed(l):              # iterate over values in reversed order
for index, element in enumerate(l):      # iterate over indices and values
for element1, element2 in zip(l1, l2):   # iterate over multiple lists concurrently

    
# test
'element' in l                           # test membership
'element' not in l                       # test non-membership
```

## tuple

- like list, but ***immutable***
- more memory efficient, and faster access than lists

```python
# construct
t = ()                                   # construct empty tuple
t = 'a','b','c'                          # construct typle from literal
t = ('a','b','c')                        # construct tuple from literal
t = tuple(l)                             # construct tuple from list
l = list(t)                              # construct list from tuple
t2 = t[0:4]                              # construct from slice of elements 0-3
t2 = t[1:]                               # construct from slice of all elements but first
t2 = t[0:-1]                             # construct from slice of all elements but last
t2 = t[:2]                               # construct from slice of first two elements
t2 = t[:]                                # construct from slice of all elements (complete list copy)

# access
len(t)                                   # length of tuple
t[0]                                     # first element in tuple         
t[-1]                                    # last element in tuple
t.index('element')                       # index of 'element' if found, else ...
k,v = ('a','b')                          # desctructure

# mutate - n/a, tuples are immutable

# iterate
for element in t:                        # iterate over elements
for element in reversed(t):              # iterate over elements in reversed order
for index, element in enumerate(t):      # iterate over indices and elements
for element1,element2 in zip(t1, t2):    # iterate over multiple tuples concurrently
    
# test
'element' in t                           # test membership
'element' not in t                       # test non-membership
```

## set

```python
# construct / copy / slice
s = set()                                # construct empty set
s = {'a','b','c'}                        # construct set from set literal
s2 = copy(s)                             # construct set from set (copy)
s = set(l)                               # construct set from list
l = list(s)                              # construct list from set

# mutate
s.add('element')                         # add
s.remove('element')                      # remove element by value, raise error if missing
s.discard('element')                     # remove element by value, no error if missing
s.pop()                                  # remove last element
s.clear()                                # remove all elements

# set operations
s.update(s2)                             # union, update original set 
s.union(s2)                              # union, return set of all elements from all sets
s | s2                                   # union, ...
s | s2 | s3                              # union, ...

s.intersection(s2)                       # intersection, return set of elements common to all sets
s & s2                                   # intersection, ...
s & s2 & s3                              # intersection, ...

s.difference(s2)                         # difference, return set of elements unique to first set
s - s2                                   # difference, ...
s.symmetric_difference(2)                # difference, return set of elements not common to all sets
s ^ s2                                   # difference, ...

# iterate
for i in s:                              # iterate over

# test
s.issuperset(s2)                         # test whether s is a superset of s2 (all elements in s2 are in s)
s.issubset(s2)                           # test whether s is a subset of s2 (all elements in s are in s2)
s.isdisjoint(s2)                         # test whether no elements common to both sets
```



## dict

```python
# construct
d = {}                                   # construct empty dict
d = {                                    # construct from inline dict
  'key1': 'val1',
  'key2': 'val2',
  'key3': 'val3'
}
d = dict(key1 = 'val1', key2 = 'val2')   # construct from inline 
d3 = {**d1, **d2}                        # construct as merger of two dicts
d2 = d.copy()                            # construct from *shallow* copy of dict
d2 = d.fromkeys(keys, value)             # construct from key iterable and value (all keys get common value)

# access
len(d)                                   # dict length
d['key']                                 # access value by key
d['key']['subkey']                       # access value by key, nested dict
d.get('key')                             # access value by key, 
d.keys()                                 # list of dict keys
d.values()                               # list of dict values
d.items()                                # list of k-v tuples for each item // => [(k1,v1), (k2,v2), ...]

# mutate
d['key'] = 'value'                       # set
d.setdefault('key', 'value')             # set, if isn't already set
d.pop('key')                             # remove item with key, and return value 
d.popitem('key')                         # remove item with key, and return item as tuple
del d['key']                             # remove item with key
d.clear()                                # remove all items
update

# iterate
for k in d.keys():                      # iterate over keys
for v in d.values():                    # iterate over values
for i in d.items():                     # iterate over items. i is a tuple (k,v)
for k,v in d.items():                   # iterate over items. k,v are scalar values

# format
import pprint
pprint.pprint(d)

# test 
'key' in d.keys()                       # test key membership
'key' not in d.keys()                   # test key non-membership
'value' in d.values()                   # test value membership 
'value' not in d.values()               # test value non-membership
```

