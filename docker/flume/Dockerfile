FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN curl http://apache.cs.utah.edu/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz | \
  tar -xz && mv apache-flume-1.8.0-bin flume
RUN apt-get update && apt-get install -y dos2unix
ENV FLUME_HOME /opt/flume
ENV PATH $FLUME_HOME/bin:$PATH
ENV agent_name data_pipeline
COPY docker/scripts/healthcheck.sh /utilities/healthcheck.sh
COPY docker/scripts/flume_agent_alive.sh /utilities/flume_agent_alive.sh
COPY docker/scripts/start_flume_agent.sh /utilities/start_flume_agent.sh
COPY flafka/data_pipeline.config /opt/flume/data_pipeline.config
RUN find /utilities -type f -print0 | xargs -0 dos2unix
CMD /utilities/start_flume_agent.sh
