FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
CMD ["tail", "-f", "/dev/null"]
#CMD zookeeper-server-start.sh "$KAFKA_HOME/config/zookeeper.properties"
