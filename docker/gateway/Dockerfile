FROM v3nd3774/data_pipeline:base-image
RUN apt-get install -y build-essential python-pip
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$PATH
WORKDIR /
COPY producer /producer
RUN  pip install -r /producer/requirements.txt
RUN /utilities/set_zookeeper_address.sh
CMD /utilities/start_gateway.sh
