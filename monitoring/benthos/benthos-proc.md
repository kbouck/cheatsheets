







# mapping

- formerly: bloblang
- input document immutable
- produces new document

```yaml
pipeline:
  processors:
    - label: ""
    - mapping: |
        root.id = this.id
        root.fans = this.fans.filter(fan -> fan.obsession > 0.5)
```

# mutation

- like mapping, but modifes existing document in-place

```yaml
pipeline:
  processors:
    - mutation: |
        root.description = deleted()
        root.fans = this.fans.filter(fan -> fan.obsession > 0.5)
```



# grok

```yaml
# 2018-12-04 16:53:42 EST 
label: ""
grok:
  expressions: []
  pattern_definitions: {}
  pattern_paths: []
  named_captures_only: true
  use_default_patterns: true
  remove_empty_values: true

```

