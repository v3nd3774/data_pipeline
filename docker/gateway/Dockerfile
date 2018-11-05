FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka && mkdir /utilities
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
COPY scripts/healthcheck.sh /utilities/healthcheck.sh
COPY scripts/set_zookeeper_address.sh /utilities/set_zookeeper_address.sh
COPY scripts/create_topic.sh /utilities/create_topic.sh
COPY scripts/start_gateway.sh /utilities/start_gateway.sh
COPY scripts/brokers_alive.sh /utilities/brokers_alive.sh
COPY scripts/twitter_topic_exist.sh /utilities/twitter_topic_exist.sh
RUN /utilities/set_zookeeper_address.sh
CMD /utilities/start_gateway.sh
