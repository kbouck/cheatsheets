# boilerplate


```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="description" content="The HTML5 Herald">
  <meta name="author" content="SitePoint">
  <link rel="stylesheet" href="css/styles.css?v=1.0">
</head>
<body>
  <script src="js/scripts.js"></script>
</body>
</html>
```

# javascript

```html
<script type="text/javascript"> ...</script>      <!-- inline script -->
<script src="filename.js"></script>               <!-- include script -->
```

# dom

```javascript
document.getElementById("elementID")             // get element
element.innerHTML = "Hello World!";              // modify element
document.write(a);                               // append element

console.log(a);                                  // log to browser console
alert("Alert!");                                 // pop up modal alert
var response = confirm("Are up Sure?");          // pop up modal alert with yes/no prompt
prompt("Your age?","0");                         // pop up modal input with initial value 
```





# button

```javascript
const adviceElement = document.createElement("span");
async function onClick(event) {
    // Example response: {"slip": { "id": 163, "advice": "Big things have small beginnings."}}
    const data = await (await fetch(`https://api.adviceslip.com/advice`, {cache: "no-store"})).json();
    adviceElement.innerText = data.slip.advice;
}
```

```html
<button @click=${onClick}>Give me advice</button>
${adviceElement}
```



