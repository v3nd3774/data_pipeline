FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka && mkdir /utilities
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
COPY scripts/start_broker.sh /utilities/start_broker.sh
CMD /utilities/start_broker.sh
