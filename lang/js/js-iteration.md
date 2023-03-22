# for, while

```javascript
// for
for (let i = 0; i < 5; i++) { ... }
for (; i < len; ) { ... }

// for-in
for (variable in object) { ... }         // loop through properties of an object
for (variable in array) { ... }          // loop through elements of an array

// Array.forEach()
array.forEach(() => { ... })             // call function once for each array element

// for-of
for (variable of iterable) { ... }       // loops through values of an iterable

// while
while (condition) { ... }

// do-while
do { ... } while (condition)

```

# iterable

- that which can be used with `for..of`
- may or may not be *array-like*

```javascript
// construct
let iterable = Array.from(iterable);      // iterable to array (copy)

// iterate
for (let c of "abc") { ... }              // iterate over string
```

- *iterables* return *iterators* by implementing the method named `[Symbol.iterator]`
- *iterators* implement the `next()` method, which provides the value at each iteration, and indicate when done*
  - *infinite iterators are possible, 

```javascript
[Symbol.iterator]() {                     // invoked once by for..of, returns an *iterator*
    return { next() { ... } }             // returns value for each iteration, and indicates when done
}
```

next() returns:

```javascript
{
    value: <value>,
    done: <boolean>
}
```



# array-like

- have indexes and lengths
- may or may not be *iterable*
- usually not an actual array (no push/pop/etc)

```javascript
let arr = Array.from(arrayLike);           // array-like to array (copy)
```



# generators

- generator functions return iterable sequence of values
- calling generator function returns generator object

```javascript
function* seq(start, max) {           // generator fn definition (function* ...)
    for (int n=start; n<max; n++) {
        yield n;                      // pause generator fn execution, next() returns { value: ..., done: false }
    }
    return max;                       // next() returns { value: <return-val>, done: done: true }
}
    
let s = seq(2, 5);                    // instantiate generator, return as generator object 
                                      // NOTE: does not run generator function yet!
let n = generator.next();             // start/continue generator fn execution until next yield or return statement
```

- next() function returns same as iterator next():

```javascript
{
    value: <value>,                   // yielded or returned value
    done: <boolean>                   // yield: false, return: true
}
```



```javascript
for(let value of generator) { ... }      // iterate over a generator
```



