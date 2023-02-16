



# Imports



# Construction









## Filter Stream by Line

```java
public static void filterStream(InputStream inStream, OutputStream outStream, String filterPattern, boolean negate) throws IOException {
    Pattern pattern = Pattern.compile(filterPattern);
    BufferedReader reader = new BufferedReader(new InputStreamReader(inStream, "UTF-8"));
    BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outStream));

    for (String line = null; (line = reader.readLine()) != null;) {
	    boolean found = pattern.matcher(line).find();
      if ((found && negate) || (!found && !negate)) {
        writer.write(line);
        writer.newLine();        
      }
    }

    writer.flush();
}
```

