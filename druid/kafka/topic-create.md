## Create Topic with 2 partitions
``
bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 1 --topic druid-query

bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 1 --topic druid-metric

bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 1 --topic druid-alert

bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 2 --topic events


bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 1 --topic druid-mt-query

bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 1 --topic druid-mt-metric

bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 1 --topic druid-mt-alert

bin/kafka-topics.sh --zookeeper localhost:2181 --create --replication-factor 1 --partitions 2 --topic events-mt

```

