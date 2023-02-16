



confluent-cli

# cheatsheet



# confluent-cli

```bash
# install (latest version)
curl -L --http1.1 https://cnfl.io/cli | sh -s -- -b /usr/local/bin

# update cli
confluent update


# publish events
kafka topic produce poems --parse-key


```





# kafka-cli

```bash
# common options
--bootstrap-server localhost:9092   # "Kafka cluster URL"

# list topics
kafka-topics.sh --list

# view topic
kafka-topics.sh --describe --topic my-topic

# create topic
kafka-topics.sh --create --topic my-topic --partitions 3 --replication-factor 1

# alter topic
# - set retention policy (5 minutes)
kafka-topics.sh --alter --topic my-topic --config retention.ms=300000*
# - add partitions to a topic
kafka-topics.sh --alter --topic my-topic --partitions 10

# delete topic
kafka-topics.sh --delete --topic my-topic
# - delete retention policy 
kafka-topics.sh --alter --topic mytopic --delete-config retention.ms


# publish events (interactive, each line is an event, ctrl-c to stop)
kafka-console-producer.sh --topic my-topic
# - provide key in form 'key: "event"'
kafka-console-producer.sh --topic my-topic --property "parse.key=true"
kafka-console-producer.sh --topic my-topic --property "parse.key=true" --property "key.separator=:"


# view events
kafka-console-consumer.sh --topic my-topic --from-beginning



```

