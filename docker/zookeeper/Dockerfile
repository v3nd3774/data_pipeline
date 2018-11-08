FROM datapipeline_base_image
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
CMD /utilities/start_keeper.sh
