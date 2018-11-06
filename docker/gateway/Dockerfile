FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka && mkdir /utilities
RUN apt-get -y update && apt-get -y install python-pip python-dev build-essential vim
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
COPY docker/scripts/healthcheck.sh /utilities/healthcheck.sh
COPY docker/scripts/set_zookeeper_address.sh /utilities/set_zookeeper_address.sh
COPY docker/scripts/create_topic.sh /utilities/create_topic.sh
COPY docker/scripts/start_gateway.sh /utilities/start_gateway.sh
COPY docker/scripts/brokers_alive.sh /utilities/brokers_alive.sh
COPY docker/scripts/twitter_topic_exist.sh /utilities/twitter_topic_exist.sh
COPY producer /producer
RUN  pip install -r /producer/requirements.txt
RUN /utilities/set_zookeeper_address.sh
CMD /utilities/start_gateway.sh
