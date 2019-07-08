#!/bin/bash

docker run -d --name httplogger -p 8083:8080 \
    --restart always --network crazerace \
    --memory=50m --cpus="0.1" \
<<<<<<< HEAD
    czarsimon/httplogger:0.3
=======
    czarsimon/httplogger:0.2
>>>>>>> ccc2799289b6f7e7bd5eb67f71120877feb60d0f
