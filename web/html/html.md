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



