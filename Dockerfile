FROM openjdk:11-jre

MAINTAINER taotao<taotao@qq.com>

RUN mkdir -p /senergy/{app,logs} && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/shanghai" > /etc/timezone;

WORKDIR /senergy/app

ADD target/jenkins-test-1.0.jar ./

EXPOSE 8089

ENTRYPOINT ["java","-jar", "-Dfile.encoding=utf-8", "./jenkins-test-1.0.jar","-XX:G1HeapRegionSize=16MB","-XX:-UseContainerSupport","-server","-XX:+UseStringDeduplication","-XX:+UseG1GC","-XX:+DisableExplicitGC", "-XX:-HeapDumpOnOutOfMemoryError","-XX:+AggressiveOpts"]