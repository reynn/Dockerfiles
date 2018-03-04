ARG JENKINS_VERSION=2.109-alpine
FROM jenkins/jenkins:$JENKINS_VERSION

LABEL Maintaner="Nic Patterson <arasureynn@gmail.com>" \
      BasedOn="${JENKINS_VERSION}"

# !println Jenkins.instance.pluginManager.plugins.collect { "${it.shortName}:${it.version}" }.sort().join(' ')

RUN /usr/local/bin/install-plugins.sh ace-editor:1.1 analysis-core:1.95 ansicolor:0.5.2 ant:1.8 antisamy-markup-formatter:1.5 apache-httpcomponents-client-4-api:4.5.3-2.1 authentication-tokens:1.3 aws-credentials:1.23 aws-java-sdk:1.11.264 blueocean-autofavorite:1.2.2 blueocean-bitbucket-pipeline:1.4.2 blueocean-commons:1.4.2 blueocean-config:1.4.2 blueocean-core-js:1.4.2 blueocean-dashboard:1.4.2 blueocean-display-url:2.2.0 blueocean-events:1.4.2 blueocean-git-pipeline:1.4.2 blueocean-github-pipeline:1.4.2 blueocean-i18n:1.4.2 blueocean-jira:1.4.2 blueocean-jwt:1.4.2 blueocean-personalization:1.4.2 blueocean-pipeline-api-impl:1.4.2 blueocean-pipeline-editor:1.4.2 blueocean-pipeline-scm-api:1.4.2 blueocean-rest-impl:1.4.2 blueocean-rest:1.4.2 blueocean-web:1.4.2 blueocean:1.4.2 bouncycastle-api:2.16.2 branch-api:2.0.18 build-timeout:1.19 checkstyle:3.50 cloudbees-bitbucket-branch-source:2.2.10 cloudbees-folder:6.3 command-launcher:1.2 credentials-binding:1.15 credentials:2.1.16 display-url-api:2.2.0 docker-commons:1.11 docker-workflow:1.15.1 durable-task:1.18 email-ext:2.61 favorite:2.3.1 git-client:2.7.1 git-server:1.7 git:3.8.0 github-api:1.90 github-branch-source:2.3.2 github-oauth:0.29 github:1.29.0 gradle:1.28 handlebars:1.1.1 handy-uri-templates-2-api:2.1.6-1.0 htmlpublisher:1.14 http_request:1.8.22 icon-shim:2.0.3 jackson2-api:2.8.11.1 javadoc:1.4 jenkins-design-language:1.4.2 jira:2.5 jquery-detached:1.2.1 jsch:0.1.54.2 junit:1.24 ldap:1.20 mailer:1.20 mapdb-api:1.0.9.0 matrix-auth:2.2 matrix-project:1.12 maven-plugin:3.1 mercurial:2.3 momentjs:1.1.1 node-iterator-api:1.5.0 pam-auth:1.3 pipeline-build-step:2.7 pipeline-github-lib:1.0 pipeline-githubnotify-step:1.0.4 pipeline-graph-analysis:1.6 pipeline-input-step:2.8 pipeline-milestone-step:1.3.1 pipeline-model-api:1.2.7 pipeline-model-declarative-agent:1.1.1 pipeline-model-definition:1.2.7 pipeline-model-extensions:1.2.7 pipeline-rest-api:2.9 pipeline-stage-step:2.3 pipeline-stage-tags-metadata:1.2.7 pipeline-stage-view:2.9 pipeline-utility-steps:2.0.1 plain-credentials:1.4 pubsub-light:1.12 rebuild:1.27 resource-disposer:0.8 scm-api:2.2.6 script-security:1.41 slack:2.3 sse-gateway:1.15 ssh-credentials:1.13 ssh-slaves:1.26 structs:1.14 subversion:2.10.3 swarm:3.10 timestamper:1.8.9 token-macro:2.3 variant:1.1 windows-slaves:1.3.1 workflow-aggregator:2.5 workflow-api:2.26 workflow-basic-steps:2.6 workflow-cps-global-lib:2.9 workflow-cps:2.45 workflow-durable-task-step:2.19 workflow-job:2.17 workflow-multibranch:2.17 workflow-remote-loader:1.4 workflow-scm-step:2.6 workflow-step-api:2.14 workflow-support:2.18 ws-cleanup:0.34
