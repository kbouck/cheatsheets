



# Map

## Nested put

```java
import java.util.Map;
import java.lang.reflect.Constructor;

public static Object putByPath(Map map, String path, Object value) {

    // Trim leading and trailing /'s from path
    path = path.replaceAll("^/+", "").replaceAll("/+$", "");

    String[] pathNodes = path.split("/");
    Map currentMap = map;

    // Drill down into second-to-last path node
    for (int i = 0; i <= pathNodes.length-2; i++) {

        // If a map already exists at this path node, then we use it
        if (currentMap.get(pathNodes[i]) instanceof Map) {
            currentMap = (Map)currentMap.get(pathNodes[i]);

        // Otherwise create/override this path node with a newly created map
        // of the same class as parent
        } else {      
            try {
                Constructor constructor = currentMap.getClass().getConstructor();
                Object newMap = constructor.newInstance();
                currentMap.put(pathNodes[i], newMap);
                currentMap = (Map)newMap;
            } catch (Exception e) {
                throw new IllegalArgumentException(e);
            } 
        }
    }

    // Put the value into the last node
    return currentMap.put(pathNodes[pathNodes.length-1], value);
}
```








## Nested get

```java
import java.util.Map;

public static Object getByPath(Map map, String path) {

    // Trim leading and trailing /'s from path
    path = path.replaceAll("^/+", "").replaceAll("/+$", ""); 

    String[] pathNodes = path.split("/");
    Map currentMap = map;

    // Drill down into second-to-last path node
    for (int i = 0; i <= pathNodes.length-2; i++) {
        if (currentMap.get(pathNodes[i]) instanceof Map) {
          currentMap = (Map)currentMap.get(pathNodes[i]);
        } else {
            return null;
        }
    }

    // Return the value at the last node
    return currentMap.get(pathNodes[pathNodes.length-1]);
}
```















reference

```java
    public static Object putByPath(Map map, String path, Object value) {

        // Trim leading and trailing /'s from path
        path = path.replaceAll("^/+", "").replaceAll("/+$", "");

        String[] pathNodes = path.split("/");
        Map currentMap = map;

        // Drill down into second-to-last path node
        for (int i = 0; i <= pathNodes.length-2; i++) {

            // If no map exists at this path node, then create new map
            // of same class as parent
            if (!currentMap.containsKey(pathNodes[i]) ||
                !(currentMap.get(pathNodes[i]) instanceof Map)) {
                try {
                    Constructor constructor = currentMap.getClass().getConstructor();
                    Object newMap = constructor.newInstance();
                    currentMap.put(pathNodes[i], newMap);
                } catch (Exception e) {
                    // What do do here?
                    throw new IllegalArgumentException(e);
                }
            }

            if (currentMap.get(pathNodes[i]) instanceof Map) {
              currentMap = (Map)currentMap.get(pathNodes[i]);

            } else {
                return null;
            }
        }

        // Return the value at the last node
        return currentMap.put(pathNodes[pathNodes.length-1], value);
    }
```



