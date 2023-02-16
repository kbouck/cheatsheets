

Runtimes

```bash
# Mac
# - Notes:
# - missing things like console.log, fetch, etc.
# - can be shebang'd
/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Helpers/jsc




```



# String Interpolation

[JavaScript](https://en.wikipedia.org/wiki/JavaScript), as of the [ECMAScript](https://en.wikipedia.org/wiki/ECMAScript) 2015 (ES6) standard, supports string interpolation using backticks ````. This feature is called *template literals*.[[7\]](https://en.wikipedia.org/wiki/String_interpolation#cite_note-7) Here is an example:

```javascript
var apples = 4;
var bananas = 3;
console.log(`I have ${apples} apples`);
console.log(`I have ${apples + bananas} fruit`);
```





# template literals (template strings)

```javascript
// strings or multi-line strings delimited by back-ticks:
`some string`

// multi-line
`some
 multi-line
 string`

// support interpolation
`some string with ${interpolation}`

// tag function
// - calls function, passes template literal as first arg, and any interpolation expresses as subsequent args
function html(literals, ...vars) {
  let raw = literals.raw
}

html`some string`




```





# HTTP


## fetch

```javascript
rawForecast = (await fetch("https://api.weather.gov/gridpoints/OKX/33,37/forecast")).json()

const data = await (await fetch(`https://api.adviceslip.com/advice`, {cache: "no-store"})).json();
adviceElement.innerText = data.slip.advice;




```





