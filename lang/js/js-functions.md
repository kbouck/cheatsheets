



# defaults

```javascript
function f(a, b = 2) { }          // a defaults to undefined, b defaults to 2
```

# rest parameter

- accept indefinite number of args as an array

```javascript
function sum(...args) {
    return args.reduce(function(a, b) { return a + b; });
}   
sum(1);     // 1
sum(1,2);   // 3
```

# arguments object

- an array of arguments passed to the function

```javascript
function f() {
    return arguments.length;
}
```



# this

- https://www.w3schools.com/js/js_this.asp

| Precedence | when referenced in a/an... | 'this' refers to...             |
| ---------- | -------------------------- | ------------------------------- |
|            | object method              | the object                      |
|            | alone                      | global object                   |
|            | function                   | global object                   |
|            | function (strict-mode)     | global object                   |
|            | event                      | element that received the event |
|            |                            |                                 |

this precedence:

| Precedence | Object             |
| ---------- | ------------------ |
| 1          | bind()             |
| 2          | apply() and call() |
| 3          | Object method      |
| 4          | Global scope       |



# apply





# closures

