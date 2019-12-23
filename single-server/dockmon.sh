#!/bin/bash
IMAGE=$1

docker run -d --network crazerace -p 17777:7777 --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc/dockmon/serviceConf.yml:/etc/dockmon/serviceConf.yml
    -e DOCKMON_USERNAME='' \
    -e DOCKMON_PASSWORD='' \
    $IMAGE -storage memory

sh /var/scripts/promtail.sh
echo "Deployed dockmon(image=$IMAGE) and restarted promtail"