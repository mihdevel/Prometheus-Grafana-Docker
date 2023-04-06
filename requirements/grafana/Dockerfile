FROM debian:buster
RUN apt update && apt -y upgrade && apt -y install vim wget curl libfontconfig1
WORKDIR /work_directory
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-9.4.7.linux-amd64.tar.gz && \
    tar -zxvf grafana-enterprise-9.4.7.linux-amd64.tar.gz && \
    mv grafana-9.4.7 grafana && \
    rm -f grafana-enterprise-9.4.7.linux-amd64.tar.gz
WORKDIR /work_directory/grafana
ENTRYPOINT ["./bin/grafana-server", "web"]
# ENTRYPOINT ["tail", "-f"]
