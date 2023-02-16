

# imports

```java
import java.nio.file.Files;
import java.nio.file.Paths;
```



# read from file

```java
// file => byte[]
byte[] bytes = Files.readAllBytes(Paths.get("/tmp/input.zip"));

// file => string
String s = new String(Files.readAllBytes(Paths.get("file.txt")));
```

# write to file

```java

// byte[] => file
try (FileOutputStream stream = new FileOutputStream("/tmp/output.zip")) {
    stream.write(outputBytes);
}
```



## 