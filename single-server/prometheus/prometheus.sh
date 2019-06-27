#!/bin/bash

docker run -d -p 19090:9090 --name prometheus \
    --network crazerace --restart always \
    --mount type=volume,source=prometheus,target=/prometheus \
    -v "$PWD/config.yml":/etc/prometheus/prometheus.yml \
    prom/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus