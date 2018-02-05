FROM alpine:3.6

EXPOSE 9191

RUN apk add --update --no-cache \
        build-base \
        python \
        py-pip \
        openssl \
        libffi-dev \
        python-dev \
    && pip install ara

ENTRYPOINT [ "ara-manage", "runserver" ]
