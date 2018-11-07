FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka && mkdir /utilities
RUN apt-get update && apt-get install -y dos2unix
RUN apt-get install -y openjdk-8-jdk-headless
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
COPY scripts/healthcheck.sh /utilities/healthcheck.sh
COPY scripts/set_zookeeper_address.sh /utilities/set_zookeeper_address.sh
COPY scripts/set_listener_address.sh /utilities/set_listener_address.sh
COPY scripts/start_broker.sh /utilities/start_broker.sh
COPY scripts/create_topic.sh /utilities/create_topic.sh
COPY scripts/brokers_alive.sh /utilities/brokers_alive.sh
RUN find /utilities -type f -print0 | xargs -0 dos2unix
RUN /utilities/set_zookeeper_address.sh
RUN /utilities/set_listener_address.sh
CMD /utilities/start_broker.sh
