https://www.benthos.dev/docs/components/outputs/about

```yaml
output:
  label: ""
  <output>:
    <option>: ...
```

# aws

- https://www.benthos.dev/docs/components/outputs/aws_dynamodb
- https://www.benthos.dev/docs/components/outputs/aws_kinesis
- https://www.benthos.dev/docs/components/outputs/aws_kinesis_firehose
- https://www.benthos.dev/docs/components/outputs/aws_s3
- https://www.benthos.dev/docs/components/outputs/aws_sns
- https://www.benthos.dev/docs/components/outputs/aws_sqs

```yaml
  aws_s3:
    bucket: ""
    path: ${!count("files")}-${!timestamp_unix_nano()}.txt
    tags: {}
    content_type: application/octet-stream
    metadata:
      exclude_prefixes: []
    max_in_flight: 64
    batching:
      count: 0
      byte_size: 0
      period: ""
      check: ""
```

# azure

- https://www.benthos.dev/docs/components/outputs/azure_blob_storage
- https://www.benthos.dev/docs/components/outputs/azure_queue_storage
- https://www.benthos.dev/docs/components/outputs/azure_table_storage

```yaml
# azure blob
  azure_blob_storage:
    storage_account: ""
    storage_access_key: ""
    storage_sas_token: ""
    storage_connection_string: ""
    container: ""
    path: ${!count("files")}-${!timestamp_unix_nano()}.txt
    max_in_flight: 64

# azure queue
  azure_queue_storage:
    storage_account: ""
    storage_access_key: ""
    storage_connection_string: ""
    queue_name: ""
    max_in_flight: 64
    batching:
      count: 0
      byte_size: 0
      period: ""
      check: ""

# azure table
  azure_table_storage:
    storage_account: ""
    storage_access_key: ""
    storage_connection_string: ""
    table_name: ""
    partition_key: ""
    row_key: ""
    properties: {}
    max_in_flight: 64
    batching:
      count: 0
      byte_size: 0
      period: ""
      check: ""
```



# elasticsearch

```yaml
  elasticsearch:
    urls: []
    index: ""
    id: ${!count("elastic_ids")}-${!timestamp_unix()}
    type: ""
    max_in_flight: 64
    batching:
      count: 0
      byte_size: 0
      period: ""
      check: ""
```

# file

- https://www.benthos.dev/docs/components/outputs/file

```yaml
  file:
    path: ""
    codec: lines
```

# kafka

- https://www.benthos.dev/docs/components/outputs/kafka
- https://www.benthos.dev/docs/components/outputs/kafka_franz

```yaml
  kafka:
    addresses: []
    topic: ""
    target_version: 2.0.0
    key: ""
    partitioner: fnv1a_hash
    compression: none
    static_headers: {}
    metadata:
      exclude_prefixes: []
    max_in_flight: 64
    batching:
      count: 0
      byte_size: 0
      period: ""
      check: ""
```

# mqtt

- https://www.benthos.dev/docs/components/outputs/mqtt

```yaml
  mqtt:
    urls: []
    topic: ""
    client_id: ""
    qos: 1
    connect_timeout: 30s
    write_timeout: 3s
    retained: false
    max_in_flight: 64
```

# sql_insert

- https://www.benthos.dev/docs/components/outputs/sql_insert

```yaml
  sql_insert:
    driver: ""
    dsn: ""
    table: ""
    columns: []
    args_mapping: ""
    max_in_flight: 64
    batching:
      count: 0
      byte_size: 0
      period: ""
      check: ""
```

# stdout

- https://www.benthos.dev/docs/components/outputs/stdout

```yaml
  stdout:
    codec: lines              # lines, delim:<delim>, append (no delim)
```

# websocket

- https://www.benthos.dev/docs/components/outputs/websocket

```yaml
  websocket:
    url: ""
```

