#!/bin/bash
IMAGE=$1

docker run -d --name httplogger -p 8083:8080 \
    --restart always --network crazerace \
    --memory=50m --cpus="0.1" \
    $IMAGE

sh /var/scripts/promtail.sh
echo "Deployed httplogger(image=$IMAGE) and restarted promtail"
