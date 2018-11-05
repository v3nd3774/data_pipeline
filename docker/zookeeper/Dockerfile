FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
COPY scripts/healthcheck.sh /utilities/healthcheck.sh
COPY scripts/start_keeper.sh /utilities/start_keeper.sh
COPY scripts/zookeeper_alive.sh /utilities/zookeeper_alive.sh
CMD /utilities/start_keeper.sh
