#!/bin/bash

docker run -d --name user-service -p 8080:8080 \
    --restart always --network crazerace \
    -e DB_HOST='crazerace-db' -e DB_PORT='5432' \
    -e DB_USERNAME='userservice' -e DB_NAME='directory' \
    -e DB_PASSWORD=$USER_SERVICE_DB_PASSWORD \
    -e JWT_SECRET=$JWT_SECRET \
    eu.gcr.io/crazerace/user-service:1.0-RC