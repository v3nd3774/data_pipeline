FROM uhopper/hadoop-datanode
WORKDIR /opt
RUN apt-get update && apt-get install -y dos2unix openjdk-8-jdk-headless dnsutils bzip2
COPY docker/scripts /utilities
RUN find /utilities -type f -print0 | xargs -0 dos2unix
CMD exit 0
