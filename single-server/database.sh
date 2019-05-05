#!/bin/bash


# Starts database
docker run -d --name crazerace-db \
    --network crazerace --restart always \
    -e POSTGRES_PASSWORD=$ROOT_DB_PASSWORD \
    postgres:11.2-alpine


# Starts database admin ui
docker run -d --name pgweb -p 8081:8081 \
    --network crazerace --restart always \
    sosedoff/pgweb

