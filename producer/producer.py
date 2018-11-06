from kafka import KafkaProducer
TIMEOUT_SECONDS=30
DATA_SOURCE = [b"testing", b"producer", b"writes"]
brokers = ["broker:9092"]
producer = KafkaProducer(bootstrap_servers=brokers)
for data in DATA_SOURCE:
  producer.send("twitter", data).get(timeout=TIMEOUT_SECONDS)
