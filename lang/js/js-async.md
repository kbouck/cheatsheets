

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

- represents the eventual completion (or failure) of an asynchronous operation and its resulting value.
- contains both the asynchronous operation code and calls to the consuming code
- promise states:
  - pending: initial state
  - fulfilled: success
  - rejected: failed

```javascript
const p = new Promise((resolve, reject) => {
  setTimeout(() => { resolve("done"); }, 300);
});


// chained
p.then(handleFulfilledA, handleRejectedA)
 .then(handleFulfilledB, handleRejectedB)
 .then(handleFulfilledC, handleRejectedC);
 .catch(handleRejectedAny);

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
                   
                   
// await
                   
```



# await

- makes function pause execution and wait for resolved promise before continuing
- can only be used inside an `async` function

```javascript
let value = await promise;

async function f() {
  let p = new Promise(function(resolve, reject) { resolve("done."); });
  document.getElementById("demo").innerHTML = await myPromise;
}
```

