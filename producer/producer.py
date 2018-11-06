from reddit import Reddit
from kafka import KafkaProducer
timeout_in_sec=30
brokers = ["broker:9092"]
topic = "twitter"
kafka_options = {
  'bootstrap_servers':brokers,
  'value_serializer':lambda v: v.encode('utf-8')
}
producer = KafkaProducer(**kafka_options)
for post_title in Reddit().poll():
  producer.send(topic, post_title).get(timeout=timeout_in_sec)
