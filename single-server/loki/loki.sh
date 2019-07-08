#!/bin/bash

docker run -d --name loki -p 13100:3100 \
    --network crazerace --restart always \
    grafana/loki:latest -config.file=/etc/loki/local-config.yaml