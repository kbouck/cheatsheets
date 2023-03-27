https://www.benthos.dev/docs/guides/bloblang/about

```python
# root / this / assignment
root                                # referces the new output doc
this                                # references the existing input doc 
root = this                         # copy entire input doc
root.id = this.thing.id             # assign field
id = thing.id                       # "" (root/thing are inferred if missing) 
root."a.b".c = this."a b".c         # assign using paths with special chars

# raw content
root = content()                    # 
root = content().decode("base64") 
root = content().parse_json()       #


# variables
# - temporary. discarded at end of mapping
let a = "b"                     # set variable
root.some_output.a = $a         # set payload value using variable

# metadata
# - values separate from payload
meta a = "b"                     # set metadata
meta a = {                       # set metadata (literal document)
  "b": "c"
}
meta = deleted()                 # delete all metadata

# delete
root = this                         # copy whole input doc
root.a = deleted()                  # delete just one entry

# conditional mapping
# - if/else, match
root.sorted_foo = if this.foo.type() == "array" { this.foo.sort() }

root.sound = if this.type == "cat" {
  this.cat.meow
} else if this.type == "dog" {
  this.dog.woof.uppercase()
} else {
  "sweet sweet silence"
}

root.new_doc = match this.doc {
  this.type == "article" => this.article
  this.type == "comment" => this.comment
  _ => this
}
```

# functions

- https://www.benthos.dev/docs/guides/bloblang/functions