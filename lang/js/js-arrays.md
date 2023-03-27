



```javascript
// construct
const array = ["a", "b", "c"];
const array = new Array("a", "b", "c");
const array = [10];                        // create 1-element array with 10 as the 0th value
const array = new Array(10);               // ! create 10-element array of undefined values

// access
array.length                               // number of array elements
array[0]                                   // value of 0th element
array[array.length - 1]                    // value of last element

// mutate
array.sort()                               // sort alphabetically, A..z
array.reverse()                            // sort alphabetically, z..A
array.sort((a,b) => {return a-b})          // sort numerically, ascending
array.sort((a,b) => {return b-a})          // sort numerically, descending
array.push("d");                           // append

// iterate
array.forEach(x => ...);                   // iterate, modify existing array
array.map(x => ...);                       // iterate, return new array

// tests
Array.isArray(array);                      // test if object is array
array instanceof Array;                    // test if object is array
```





## get unique field values for object array

```javascript
uniqueValues = [...new Set(someArray.map(o => o.someField))];
```



