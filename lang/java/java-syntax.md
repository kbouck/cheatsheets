

# Inline Declarations

```java
// String Array
String[] strArgs = new String[] { "one", "two", "three"};

// Maps
Map<String, String> doubleBraceMap  = new HashMap<String, String>() {{
    put("key1", "value1");
    put("key2", "value2");
}};
// WARNING: Above method creates anonymous class each time and can result in memory leak

Map<String, String> map = Map.ofEntries(
  new AbstractMap.SimpleEntry<String, String>("name", "John"),
  new AbstractMap.SimpleEntry<String, String>("city", "budapest"),
  new AbstractMap.SimpleEntry<String, String>("zip", "000000"),
  new AbstractMap.SimpleEntry<String, String>("home", "1231231231")
);


// ref: https://www.baeldung.com/java-initialize-hashmap
```

# varargs

```java
public void someMethod(String ...args) { 
    // args.length
    // for (String arg : args)
}

someMethod();
someMethod("hi");
someMethod("one", "two", "three")
someMethod(strArray)
```









