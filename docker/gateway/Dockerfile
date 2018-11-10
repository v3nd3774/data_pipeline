FROM datapipeline_base_image
RUN apt-get install -y build-essential
RUN curl http://apache.cs.utah.edu/kafka/0.10.2.2/kafka_2.10-0.10.2.2.tgz | \
  tar -xz && mv kafka_2.10-0.10.2.2 kafka
ENV KAFKA_HOME /opt/kafka
RUN curl  https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz | \
  tar -xz && mv Python-2.7.15 python-installer && mkdir python
ENV PYTHON_HOME /opt/python
WORKDIR /opt/python-installer
RUN ./configure --prefix $PYTHON_HOME --enable-optimizations && \
  make && \
  make install
ENV PATH $KAFKA_HOME/bin:$PYTHON_HOME/bin:$PATH
RUN apt-get install -y python-dev
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py
WORKDIR /
COPY producer /producer
RUN  pip install -r /producer/requirements.txt
RUN /utilities/set_zookeeper_address.sh
CMD /utilities/start_gateway.sh
