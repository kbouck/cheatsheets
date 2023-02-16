

```java
# java 8
new Thread(() -> {
    Thread.currentThread().setName("some thread name");
    // Do some stuff
}).start();
```