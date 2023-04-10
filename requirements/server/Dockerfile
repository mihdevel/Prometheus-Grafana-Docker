FROM debian:buster
RUN apt update && apt -y upgrade && apt -y install vim wget curl libfontconfig1
WORKDIR /work_directory
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz && \
    tar -zxvf node_exporter-*.*-amd64.tar.gz && \
    mv node_exporter-*.*-amd64 node_exporter && \
    rm -f node_exporter-*.*-amd64.tar.gz
WORKDIR /work_directory/node_exporter
ENTRYPOINT ["./node_exporter"]
# ENTRYPOINT ["tail", "-f"]