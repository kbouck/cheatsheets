



# Imports



# Construction

```java
Stream<Integer> stream = Stream.of(1,2,3,4,5);
Stream<Integer> stream = Stream.of(intArray); // Array to Stream
Stream<Integer> stream = list.stream();       // List to Stream
Stream<Date> stream = Stream.generate(() -> { return new Date(); }); // Generate
IntStream stream = someString.chars();  // Chars
Stream<String> stream = Stream.of(someString.split("\\$")); // String Tokens
```



# Conversion

```java
List list = stream.collect(Collectors.toList());     // Stream to List
Integer[] intArray = stream.toArray(Integer[]::new); // Stream to Integer Array
```



# Intermediate Operations

these return Stream as a result

## filter

```java
filter(i -> i > 10);
map(String::toUpperCase);
flatMap();
distinct();
sorted();
peek();
limit();
skip();
```

## map

# Terminal Operations

## forEach

```java
stream.forEach(System.out::println);
stream.forEachOrdered();
```

## toArray

```java
Integer[] intArray = stream.toArray(Integer[]::new); // Stream to Integer Array
```

## collect

```java
List<String> result = stream.collect();
```

## reduce

```java
Optional<String> result = stream.reduce();
```

## find

```java
String result = stream.findFirst().get();
String result = stream.findAny().get();
```

## match

```java
boolean result = stream.anyMatch();
boolean result = stream.allMatch();
boolean result = stream.noneMatch();
```

## min/max/count

```java
long result = stream.count();
long result = stream.min();
long result = stream.max();
```

