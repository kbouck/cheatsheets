
# todo

lots of good cheatsheet material here:
https://gto76.github.io/python-cheatsheet/



# comments

```python
# single line comment

"""
This is a
multi-line comment
"""
```

# variables

```python
v = 'value'                              # declare and assign variable
global v                                 # declare global variable scope inside function
v = str(1)                               # cast to string
v = int(1)                               # cast to int
v = float(1)                             # cast to float
type(v)                                  # return type of the variable
a, b, c = 1, 2, 3                        # multiple variable assignemnt
```

# operators

```python
# math
+                         # addition
-                         # subtraction
*                         # multiplication
/                         # division
%                         # modulus
**                        # exponent
//                        # floor division

# assignment
=                         # set left to value of right
+=                        # increment left by right
-=                        # decrement left by right
*=                        # multiple left by right
/=                        # divide left by right
%=                        # left modulus right 
//=                       # floordivide left by right
**=                       # left to the power of right
&=                        # bitwise AND
|=                        # bitwise OR
^=                        # bitwise XOR
>>=                       # bitwise right shift
<<=                       # bitwise left shift

# comparison
==                        # equal
!=                        # not equal
>, >=                     # greater-than, greater-than-or-equal
<, <=                     # less-than, less-than-or-equal

# boolean logic
and
or
not
```

# functions

```python
# named arguments
def frobnicate(*, timeout_seconds: int) -> None:
    # The * forces the caller to use named arguments
    # for all arguments after the *
```


## callbacks

```python
def handler(num):
    print("handler called with ", num)

def some_function(val, callback):
    callback(val)

caller(5, handler)
caller(10, handler)
```

