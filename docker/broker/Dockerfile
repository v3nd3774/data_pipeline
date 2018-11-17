FROM v3nd3774/data_pipeline:base-image
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
RUN /utilities/set_zookeeper_address.sh
RUN /utilities/set_listener_address.sh
CMD /utilities/start_broker.sh
