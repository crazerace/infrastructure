#!/bin/bash

docker run -d \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v serviceConf.yml:/etc/dockmon/serviceConf.yml
    -e DOCKMON_USERNAME=$DOCKMON_USERNAME \
    -e DOCKMON_PASSWORD=$DOCKMON_PASSWORD \
    czarsimon/dockmon:1.0 -storage memory