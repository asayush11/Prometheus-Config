FROM prom/prometheus

USER root

# Install envsubst
RUN apt-get update \
    && apt-get install -y gettext-base \
    && apt-get clean

# Copy template and entrypoint
COPY prometheus.yml.template /etc/prometheus/prometheus.yml.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml"]
