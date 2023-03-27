

```yaml
input:
  label: ""
  <input>:
    <options...>:
    
  # Optional list of processing steps
  processors:
   - mapping: |
       root.document = this.without("links")
       root.link_count = this.links.length()    
```

# csv

```yaml
  csv:
    paths: []
    parse_header_row: true
    delimiter: ','
    lazy_quotes: false
```

# file

```yaml
  file:
    paths: []              # path glob pattern
    codec: lines           # lines, csv, regex, gzip, tar, ... more in docs
                           # https://www.benthos.dev/docs/components/inputs/file#codec
```

# stdin

```yaml
  stdin:
    codec: lines           # similar to file
```

