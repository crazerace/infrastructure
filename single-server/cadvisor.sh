sudo docker run -d \
	--volume=/:/rootfs:ro \
	--volume=/var/run:/var/run:ro \
	--volume=/sys:/sys:ro \
	--volume=/var/lib/docker/:/var/lib/docker:ro \
	--volume=/dev/disk/:/dev/disk:ro \
	--network=crazerace --name=cadvisor \
	-p 18080:8080 --restart=always \
	google/cadvisor:latest