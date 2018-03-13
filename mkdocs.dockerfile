FROM alpine:3.7

ARG MKDOC_VERSION=0.17.3

RUN apk add --update --no-cache \
      python3 \
    && pip3 install \
      mkdocs==${MKDOC_VERSION} \
      mkdocs-material