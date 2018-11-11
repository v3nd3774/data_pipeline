FROM grafana/grafana
COPY grafana/datasource.yml /etc/grafana/provisioning/datasources/datasource.yml
COPY grafana/dashboard.yml /etc/grafana/provisioning/dashboards/dashboard.yml
COPY grafana/dashboard.json /etc/grafana/provisioning/dashboards/dashboard.json
CMD /run.sh
