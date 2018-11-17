FROM v3nd3774/data_pipeline:base-image
RUN apt-get install -y build-essential python-pip
COPY hdfs_directory_exporter /hdfs_directory_exporter
RUN pip install -r /hdfs_directory_exporter/requirements.txt
CMD /utilities/start_hdfs_directory_exporter.sh
