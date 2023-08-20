

https://18alan.space/posts/how-hard-is-it-to-build-a-frontend-framework.html



# reactivity

html:
```html
<div>
  <!-- Mark the h1 as appropriate for when "name" changes -->
  <h1 data-mark="name"></h1>
</div>
```

js:

```javascript
const handler = {
  set(user, value, property) {
    const query = `[data-mark="${property}"]`;
    const elements = document.querySelectorAll(query);

    for (const el of elements) {
      el.innerText = value;
    }

    return Reflect.set(user, value, property);
  },
};

// Regular object is omitted cause it's not needed.
const user = new Proxy({ name: 'Lin' }, handler);
```




https://18alan.space/posts/how-hard-is-it-to-build-a-frontend-framework.html