

# callbacks

- a function passed as an argument to another function

```javascript
function sum(a, b) {
  let sum = a + b;
}

function aggregate(a, b, callback) {
    return callback(a, b);
}

aggregate(5, 5, sum);
```



# promises

- represent eventual completion or failure of an asynchronous operation and its resulting value or error.
- contains both asynchronous operation code and the calls to the consuming code callback functions
- promise states:
  - pending
  - fulfilled
  - rejected

```javascript
const promise = new Promise((resolve, reject) => {
    resolve()      // call if success
    reject()       // call if failure
});


// consuming code
promise.then(onFulfilled, onRjected)   // execs promise, 
                                       // code continues, onFullfilled fn executed once promise resolved 

// chained (sequential)
promise
    .then(fulfilledFn, rejectedFn)
    .then(..., ...)
    .then(..., ...);
    .catch(...);

```









```javascript
// define
async function f() { return "done."; }              // function returns a promise
function f() { return Promise.resolve("done."); }   // function returns a promise

// call
f().then(
  function(value) { ... },                          // success
  function(error) { ... }                           // error
);              
```



# async

- makes function return promise
- resolves promise with return value

```javascript
async function f() {
    let promise = new Promise(function(resolve) {
}

async function f() {
  let p = new Promise(function(resolve, reject) { resolve("done."); });
  document.getElementById("demo").innerHTML = await myPromise;
}
```

#  await

- used only *inside* async functions
- blocks until promise is resolved

```javascript
await expression                     // expression is a promise, a then-able object, or a value

async function someFunction() {
    let result = await promise();    // block until promise resolution, then assign resolved value to var 
                                     // if resolved, await returns resolved value
                                     // if rejected, await throws rejected value
}
```

