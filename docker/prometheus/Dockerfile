FROM datapipeline_base_image
RUN curl https://github.com/prometheus/prometheus/releases/download/v2.5.0/prometheus-2.5.0.linux-amd64.tar.gz | \
  tar -xz && mv prometheus-2.5.0.linux-amd64 prometheus
ENV PROMETHEUS_HOME /opt/prometheus
ENV PATH $PROMETHEUS_HOME:$PATH
COPY prometheus/prometheus_config.yml prometheus_config.yml
RUN mv prometheus_config.yml $PROMETHEUS_HOME/prometheus_config.yml
CMD /utilities/start_prometheus.sh
