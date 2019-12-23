#!/bin/bash
IMAGE=$1

docker run -d --name game-service -p 8082:8080 \
    --restart always --network crazerace \
    -e DB_HOST='crazerace-db' -e DB_PORT='5432' \
    -e DB_USERNAME='gameservice' -e DB_NAME='games' \
    -e DB_PASSWORD='' \
    -e JWT_SECRET='' \
    --memory=400m --cpus="0.2" \
    $IMAGE

sh /var/scripts/promtail.sh
echo "Deployed game-service(image=$IMAGE) and restarted promtail"
   