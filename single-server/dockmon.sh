#!/bin/bash

docker run -d --network crazerace -p 17777:7777 --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD/serviceConf.yml":/etc/dockmon/serviceConf.yml
    -e DOCKMON_USERNAME=$DOCKMON_USERNAME \
    -e DOCKMON_PASSWORD=$DOCKMON_PASSWORD \
    czarsimon/dockmon:1.0 -storage memory