#!/bin/bash
IMAGE=$1

docker run -d --name user-service -p 8080:8080 \
    --restart always --network crazerace \
    -e DB_HOST='crazerace-db' -e DB_PORT='5432' \
    -e DB_USERNAME='userservice' -e DB_NAME='directory' \
    -e DB_PASSWORD='' \
    -e JWT_SECRET='' \
    -e PASSWORD_PEPPER='' \
    --memory=300m --cpus="0.2" \
    $IMAGE

sh /var/scripts/promtail.sh
echo "Deployed user-service(image=$IMAGE) and restarted promtail"