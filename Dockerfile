FROM ubuntu:22.04

# Install envsubst
RUN apt-get update && apt-get install -y wget tar gettext-base && apt-get clean

# Download Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.53.0/prometheus-2.53.0.linux-amd64.tar.gz \
    && tar -xzf prometheus-2.53.0.linux-amd64.tar.gz \
    && mv prometheus-2.53.0.linux-amd64 /prometheus \
    && rm prometheus-2.53.0.linux-amd64.tar.gz

# Copy template + entrypoint
COPY prometheus.yml.template /etc/prometheus/prometheus.yml.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 9090

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/prometheus/prometheus", "--config.file=/etc/prometheus/prometheus.yml"]
