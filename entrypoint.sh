#!/bin/sh

# Substitute environment variables in the Prometheus template
envsubst < /etc/prometheus/prometheus.yml.template > /etc/prometheus/prometheus.yml

echo "Prometheus config after envsubst:"
cat /etc/prometheus/prometheus.yml

exec "$@"
