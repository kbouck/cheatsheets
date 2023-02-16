

# One-liners

```java
str.matches(regexStr);                    // returns boolean result
str.replaceAll(regexStr, replaceStr);     // replace all substrings matching regex
str.replaceFirst(regexStr, replaceStr);   // replace only first substring matching regex
str.split(regexStr);                      // split string into string array
str.split(regexStr, limit);               // "", limiting size of resulting array

Pattern.compile(regex).matcher(str).*     // Access matcher object methods                                      
// https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/regex/Matcher.html

Pattern.compile(regex).matcher(str).group(i);  // Extract captured subsequence at group index i

String result = Pattern.compile(myRegex)  // Java 9
        .matcher(myText)
        .results()
        .map(m -> m.group(1))
        .findFirst()
        .orElse(null);
```

# Modifier Flags

```java
// Embedded modifier flags can be placed at beginning of regex string

(?i)         // Case Insensitive
(?m)         // Multi-line
(?d)         // Dot-All (Dots match newlines)
(?x)         // Comments and Whitespace Mode
(?u)         // Unicode-aware case folding
(?d)         // Unix lines
```

# Imports

```java
import java.util.regex.Pattern;
import java.util.regex.Matcher;
```

# Capture Groups

```java
// String Replacement
// ==================
// $1, $2, $3 - reference captured subsequence in replacement string

// $<name> - TODO would a named capture group work this way?






// String Extraction
// =================

// Three-liner
Matcher m = Pattern.compile(".*(Hell)o.*").matcher("Hello World!");
m.find();
System.out.println(m.toMatchResult().group(1)); 


// Verbose approach
String mydata = "some string with 'the data i want' inside";
Pattern pattern = Pattern.compile("'(.*?)'");
Matcher matcher = pattern.matcher(mydata);
if (matcher.find())
{
    System.out.println(matcher.group(1));
}


// Java 9 Streams approach
String result = Pattern.compile(myRegex)
        .matcher(myText)
        .results()
        .map(m -> m.group(1))
        .findFirst()
        .orElse(null);

```

