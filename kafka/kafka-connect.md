



[Kafka Connect](https://kafka.apache.org/documentation/#connect) allows you to continuously ingest data from external systems into Kafka, and vice versa.



# responsibilities

as compared to writing your own kafka publisher/consumer, kafka connect gives you:

- failover
- scale (horizontally)
- manage commonplace transformation operations on inbound or outbound data
- distribute common connector code
- configure and operate this through a standard interface
- ...

# connector types

## source

- producer (app -> source connector -> kafka broker)

## sink 

- consumer (kafka broker -> sink connector -> app)



# Standalone Mode

Simple for tests and simple environments, no fault tolerance.

```bash
$ <kafka-dir>bin/connect-standalone.sh config/connect-standalone.properties c1.properties [c2.properties ...]
```

- first param is worker config
- next param(s) are connector config(s)

# Distributed Mode



```bash
$ <kafka-dir>/bin/connect-distributed.sh config/connect-distributed.properties
```



# References

- [Kafka Connect](https://kafka.apache.org/documentation/#connect) 
- open-source Connect framework to write own connectors