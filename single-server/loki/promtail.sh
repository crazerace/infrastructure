#!/bin/bash
touch promtail-targets.yaml
rm promtail-targets.yaml
docker ps --filter 'name=httplogger|.*-service' \
    --format '- targets: ["{{.ID}}"]\n  labels:\n    service: "{{.Names}}"' \
    > promtail-targets.yaml

docker rm -f promtail

docker run -d --name promtail --network crazerace --restart always \
    -v /var/log:/var/log:ro \
    -v /var/lib/docker/containers:/var/lib/docker/containers:ro \
    -v "$PWD/promtail-targets.yaml":/etc/promtail/promtail-targets.yaml:ro \
    -v "$PWD/promtail-config.yaml":/etc/promtail/config.yaml:ro \
    grafana/promtail:latest -config.file=/etc/promtail/config.yaml