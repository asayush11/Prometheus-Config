FROM prom/prometheus

USER root

# Install envsubst from gettext
RUN apk add --no-cache gettext

# Copy template and entrypoint
COPY prometheus.yml.template /etc/prometheus/prometheus.yml.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml"]
