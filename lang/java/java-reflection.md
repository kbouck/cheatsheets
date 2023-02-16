

```java
import java.lang.reflect.Field;

// Use reflection to gain access to protected socket field
Field protectedSocket = HttpURLConnection.class.getDeclaredField("socket");
protectedSocket.setAccessible(true);
Socket socket = (Socket)protectedSocket.get(cxn);
```




