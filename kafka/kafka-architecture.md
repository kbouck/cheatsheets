



# post-zookeeper kafka

- background, see KIP-500:

  -  https://cwiki.apache.org/confluence/display/KAFKA/KIP-500%3A+Replace+ZooKeeper+with+a+Self-Managed+Metadata+Quorum

- docker compose:

  - https://github.com/confluentinc/cp-all-in-one/tree/master/cp-all-in-one-kraft

  - https://docs.confluent.io/platform/current/tutorials/build-your-own-demos.html?utm_source=github&utm_medium=demo&utm_campaign=ch.examples_type.community_content.cp-all-in-one

```bash
# start
$ cd dev/kafka/cp-all-in-one/cp-all-in-one-kraft
$ docker-compose up -d

# services
- broker (:9092, :9101)
- schema-registry (:8081)
- rest-proxy (:8082)
- connect (:8083)
- ksqldb-server (:8088)
- ksqldb-cli
- ksql-datagen
- control-center (:9021)
```





# topics



# partitions



# keys



# brokers

- hosts some set of partitions
- handles requests to read/write events from/to partitions
- handle replication of partitions between each other



# replication

- needed in order to prevent against data loss
- leader replica + follower replicas
- reading/writing generally done to the leader replica
- leader+followers cooperate to replicate data to followers
- durability guarantees configurable



# producer

- determines partition according to key (or lack thereof)



# consumer

- 

# kafka-pocalypse

- todo: summarize thoughtworks critcism
- 





