FROM docker:17.11.0-ce-git

ARG SWARM_CLIENT_VERSION=3.6

ENV LABELS "docker"
ENV EXECUTORS "3"
ENV FSROOT "/var/lib/jenkins"
ENV MASTER "http://localhost:8080"
ENV USERNAME "jenkins"

ENV JENKINS_USER_ID 1000
ENV JENKINS_GROUP_ID 1000

ADD http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$SWARM_CLIENT_VERSION/swarm-client-$SWARM_CLIENT_VERSION.jar $FSROOT/swarm-client.jar
COPY swarm-agent/entrypoint.sh /entrypoint.sh

RUN addgroup -g $JENKINS_GROUP_ID jenkins \
  && addgroup docker \
  && adduser -h $FSROOT -u $JENKINS_USER_ID -G docker -G jenkins -s /bin/bash -D jenkins \
  && chown -R $JENKINS_USER_ID:$JENKINS_GROUP_ID $FSROOT \
  && chown ${JENKINS_USER_ID}:${JENKINS_GROUP_ID} /entrypoint.sh \
  && chmod +x /entrypoint.sh \
  && apk --update --no-cache add \
      openjdk8-jre \
      git

USER jenkins

ENTRYPOINT [ "/entrypoint.sh" ]
