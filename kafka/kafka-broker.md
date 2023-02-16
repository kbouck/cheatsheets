


# Startup
```bash
# Start the ZooKeeper service
# Note: Soon, ZooKeeper will no longer be required by Apache Kafka.
$ bin/zookeeper-server-start.sh config/zookeeper.properties


# Start the Kafka broker service
$ bin/kafka-server-start.sh config/server.properties
```



# Topics

```bash
# Create Topic
$ bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092
$ bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
Topic:quickstart-events  PartitionCount:1    ReplicationFactor:1 Configs:
Topic: quickstart-events Partition: 0    Leader: 0   Replicas: 0 Isr: 0


# Write Events
$ bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
This is my first event
This is my second event


# Read Events
$ bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
This is my first event
This is my second event


# kafkacat
TODO

```





