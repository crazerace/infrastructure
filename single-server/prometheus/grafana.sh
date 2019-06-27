#!/bin/bash

docker run -d -p 13000:3000 --name grafana \
    --network crazerace --restart always \
    -e GF_SECURITY_ADMIN_PASSWORD=$GRAFANA_PASSWORD \
    --mount type=volume,source=grafana_db,target=/var/lib/grafana \
    grafana/grafana