#!/bin/bash

docker run -d --name game-service -p 8082:8080 \
    --restart always --network crazerace \
    -e DB_HOST='crazerace-db' -e DB_PORT='5432' \
    -e DB_USERNAME='gameservice' -e DB_NAME='games' \
    -e DB_PASSWORD=$GAME_SERVICE_DB_PASSWORD \
    -e JWT_SECRET=$JWT_SECRET \
    --memory=400m --cpus="0.2" \
    eu.gcr.io/crazerace/game-service:1.0-RC