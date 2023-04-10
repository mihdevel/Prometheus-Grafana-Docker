FROM debian:buster
RUN apt update && apt -y upgrade && apt -y install vim wget curl
WORKDIR /work_directory
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz && \
    tar -xzvf prometheus-2.43.0.linux-amd64.tar.gz && \
    mv prometheus-2.43.0.linux-amd64 prometheus && \
    rm -f prometheus-2.43.0.linux-amd64.tar.gz prometheus/prometheus.yml
WORKDIR /work_directory/prometheus
COPY prometheus.yml .
ENTRYPOINT ["./prometheus", "--config.file=prometheus.yml", "--web.enable-lifecycle"]
# ENTRYPOINT ["tail", "-f"]