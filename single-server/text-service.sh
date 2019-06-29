#!/bin/bash

docker run -d --name text-service -p 8081:8080 \
    --restart always --network crazerace \
    -e DB_HOST='crazerace-db' -e DB_PORT='5432' \
    -e DB_USERNAME='textservice' -e DB_NAME='texts' \
    -e DB_PASSWORD=$TEXT_SERVICE_DB_PASSWORD \
    --memory=300m --cpus="0.2" \
    eu.gcr.io/crazerace/text-service:1.0-RC