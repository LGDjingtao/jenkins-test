#!/bin/bash
docker build -t jenkins-test:latest .

docker run -d --name jenkins-test \
--restart always \
--net=host \
-v /data/alarm-center-data/logs:/senergy/app/logs \
jenkins-test:latest