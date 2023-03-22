https://vector.dev/

# history

- In 2021, Datadog acquired Timber Technologies, developers of Vector



## source

- input

# transform

- pipeline
- acts on a single event

## remap 

- VRL: vector remap language

```toml

del(.user_info)                         # delete field

# timestamp
.timestamp = now()                      # add current timestamp
.timestamp = to_unix_timestamp(to_timestamp!(.timestamp))  # timestamp convert to unix

# json
. = parse_json!(string!(.message))      # parse raw json 


.message = downcase(string!(.message))  # lowercase field 
```

## filter

- express filter condition as VRL boolean expression (true = keep, false = filter out)

```toml
[transforms.filter_out_info]
type = "filter"
inputs = ["logs"]
condition = '.severity != "info"'
```



- 

## sink

- output

# config

- supports toml, yaml, json

```toml
[sources.datadog_agent]


[transforms.remove_sensitive_user_info]


[sinks.datadog_backend]

```



# examples

## redacted-logs-to-datadog

```toml
[sources.splunk_hec_in]
type = "splunk_hec"
address = "0.0.0.0:8080"
token = "${SPLUNK_HEC_TOKEN}"

[sinks.datadog_out]
type = "datadog_logs"
inputs = ["splunk_hec_in"]
default_api_key = "${DATADOG_API_KEY}"
```



## kafka-to-elasticsearch

```toml
[sources.kafka_in]
type = "kafka"
bootstrap_servers = "10.14.22.123:9092,10.14.23.332:9092"
group_id = "vector-logs"
key_field = "message"
topics = ["logs-*"]

[transforms.json_parse]
type = "remap"
inputs = ["kafka_in"]
source = '''
  parsed, err = parse_json(.message)
  if err != null {
	log(err, level: "error")
  }
  . |= object(parsed) ?? {}
'''

[sinks.elasticsearch_out]
type = "elasticsearch"
inputs = ["json_parse"]
endpoint = "http://10.24.32.122:9000"
index = "logs-via-kafka"
```

## k8s-to-s3

```toml
[sources.k8s_in]
type = "kubernetes_logs"

[sinks.aws_s3_out]
type = "aws_s3"
inputs = ["k8s_in"]
bucket = "k8s-logs"
region = "us-east-1"
compression = "gzip"
encoding.codec = "json"
```

## splunk-to-datadog

```toml
[sources.splunk_hec_in]
type = "splunk_hec"
address = "0.0.0.0:8080"
token = "${SPLUNK_HEC_TOKEN}"

[sinks.datadog_out]
type = "datadog_logs"
inputs = ["splunk_hec_in"]
default_api_key = "${DATADOG_API_KEY}"
```

