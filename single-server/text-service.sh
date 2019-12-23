#!/bin/bash
IMAGE=$1

docker run -d --name text-service -p 8081:8080 \
    --restart always --network crazerace \
    -e DB_HOST='crazerace-db' -e DB_PORT='5432' \
    -e DB_USERNAME='textservice' -e DB_NAME='texts' \
    -e DB_PASSWORD='' \
    --memory=300m --cpus="0.2" \
    $IMAGE

sh /var/scripts/promtail.sh
echo "Deployed text-service(image=$IMAGE) and restarted promtail"