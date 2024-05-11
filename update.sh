#!/bin/bash
sudo docker build -t jenkins-test:latest .
fi
sudo docker run -d --name jenkins-test \
--restart always \
--net=host \
-v /data/alarm-center-data/logs:/senergy/app/logs \
jenkins-test:latest