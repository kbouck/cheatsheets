

xargs converts stdin to literal args


# examples

```bash
xargs touch < list.txt




echo 'one two three' | xargs mkdir


find ./foo -type f -name "*.txt" | xargs rm

# options
-t                # print command about to be run
-p                # prompt before executing command
-I                # TODO




```





parallel

- Supposedly GNU Parallel was built specifically to deal with `xargs` bad handling of special chars
- it quote " correctly, it will quote *any* string correctly, so it will be interpreted as a single argument by curl.

```bash
<source parallel curl -X POST -H "application/json" myURL -d {}
```

