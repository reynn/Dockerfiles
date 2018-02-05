FROM alpine:3.7 as HELM_BUILD

ARG HELM_VERSION=v2.7.2

WORKDIR /tmp

RUN apk add --update --no-cache \
      ca-certificates \
      curl \
      tar \
      gzip \
  && curl -L http://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar zxv -C /tmp

FROM alpine:3.7 as KUBECTL_BUILD

ARG KUBECTL_VERSION=v1.9.0

WORKDIR /tmp

RUN apk add --update --no-cache \
      ca-certificates \
      curl \
  && curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x kubectl

FROM alpine:3.7

RUN apk add --update --no-cache \
      ca-certificates \
      git

COPY --from=HELM_BUILD /tmp/linux-amd64/helm /usr/bin/helm
COPY --from=KUBECTL_BUILD /tmp/kubectl /usr/bin/kubectl

ENTRYPOINT [ "helm" ]
