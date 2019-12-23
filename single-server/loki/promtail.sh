#!/bin/bash
touch /etc/loki/promtail-targets.yaml
rm /etc/loki/promtail-targets.yaml
docker ps --filter 'name=httplogger|.*-service' \
    --format '- targets: ["{{.ID}}"]\n  labels:\n    service: "{{.Names}}"' \
    > /etc/loki/promtail-targets.yaml

docker rm -f promtail

docker run -d --name promtail --network crazerace --restart always \
    -v /var/log:/var/log:ro \
    -v /var/lib/docker/containers:/var/lib/docker/containers:ro \
    -v "/etc/loki/promtail-targets.yaml":/etc/promtail/promtail-targets.yaml:ro \
    -v "/etc/loki/promtail-config.yaml":/etc/promtail/config.yaml:ro \
    grafana/promtail:latest -config.file=/etc/promtail/config.yaml