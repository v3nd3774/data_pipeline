FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
RUN apt-get update && apt-get install -y dos2unix
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
COPY scripts/healthcheck.sh /utilities/healthcheck.sh
COPY scripts/start_keeper.sh /utilities/start_keeper.sh
COPY scripts/zookeeper_alive.sh /utilities/zookeeper_alive.sh
RUN find /utilities -type f -print0 | xargs -0 dos2unix
CMD /utilities/start_keeper.sh
