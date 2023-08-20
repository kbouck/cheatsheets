

# overview

```yaml
input:
  kafka:
    addresses: [ TODO ]
    topics: [ foo, bar ]
    consumer_group: foogroup

pipeline:
  processors:
  - mapping: |
      root.message = this
      root.meta.link_count = this.links.length()

output:
  aws_s3:
    bucket: TODO
    path: '${! meta("kafka_topic") }/${! json("message.id") }.json'
    
  # Optional list of processing steps
  processors:
    - mapping: '{"message":this,"meta":{"link_count":this.links.length()}}'    
```

# generate

```bash
benthos --print-yaml --all > conf.yaml                       # 
benthos --print-json --all > conf.json                       # 
benthos --print-yaml --example websocket,kafka,jmespath      # 

```

# linting

```bash
benthos -c ./foo.yaml --lint
```

