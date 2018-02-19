ARG IMAGE_TAG=1.10.0-alpine3.7
FROM golang:${IMAGE_TAG}

RUN apk add --update --no-cache \
      git \
    && go get -v github.com/alecthomas/gometalinter \
    && go get -v github.com/golang/dep/cmd/dep \
    && go get -v github.com/Masterminds/glide
