FROM v3nd3774/data_pipeline:base-image
RUN curl http://apache.cs.utah.edu/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz | \
  tar -xz && mv apache-flume-1.8.0-bin flume
ENV FLUME_HOME /opt/flume
ENV PATH $FLUME_HOME/bin:$PATH
ENV agent_name data_pipeline
COPY flafka/data_pipeline.config data_pipeline.config
RUN mv data_pipeline.config $FLUME_HOME/data_pipeline.config
CMD /utilities/start_flume_agent.sh
