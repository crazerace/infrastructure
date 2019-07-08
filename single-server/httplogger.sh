#!/bin/bash

docker run -d --name httplogger -p 8083:8080 \
    --restart always --network crazerace \
    --memory=50m --cpus="0.1" \
    czarsimon/httplogger:0.3