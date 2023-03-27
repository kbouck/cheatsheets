rq: record query

https://github.com/dflemstr/rq

# supported formats

- cbor
- json
- messagepack
- protobuf (only for input)
- yaml
- toml
- plain text
- csv





```bash
# 
    --format <flag-format>       # 'compact', 'readable' or 'indented'


# input formats
    -a, --input-avro             # avro container file
    -c, --input-cbor             # series of CBOR values
    -v, --input-csv              # CSV
    -j, --input-json             # white-space separated JSON values (default)
    -m, --input-message-pack     # MessagePack
    -r, --input-raw              # plain text
    -t, --input-toml             # toml
    -y, --input-yaml             # series of YAML documents
    
# output formats
    -C, --output-cbor
    -V, --output-csv
    -J, --output-json
    -M, --output-message-pack
    -R, --output-raw
    -T, --output-toml
    -Y, --output-yaml
    
# conversions
    -jC              # json -> cbor
    -cJ              # cbor -> json
    

```



