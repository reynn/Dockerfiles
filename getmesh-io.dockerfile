FROM openjdk:8u131-jre-alpine

WORKDIR /app

EXPOSE 8080

ARG MESH_VERSION=0.9.26

RUN apk add --update --no-cache curl \
    && curl https://maven.gentics.com/maven2/com/gentics/mesh/mesh-demo/${MESH_VERSION}/mesh-demo-${MESH_VERSION}.jar > /app/mesh.jar

ENTRYPOINT ["/usr/bin/env", "java", "-jar", "/app/mesh.jar"]
