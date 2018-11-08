FROM datapipeline_base_image
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
RUN curl -o Anaconda2Install.sh https://repo.continuum.io/archive/Anaconda2-5.3.0-Linux-x86_64.sh
RUN bash Anaconda2Install.sh -b && rm Anaconda2Install.sh
ENV ANACONDA_HOME /root/anaconda2
ENV KAFKA_HOME /opt/kafka
ENV PATH $KAFKA_HOME/bin:$ANACONDA_HOME/bin:$PATH
COPY producer /producer
RUN  pip install -r /producer/requirements.txt
RUN /utilities/set_zookeeper_address.sh
CMD /utilities/start_gateway.sh
