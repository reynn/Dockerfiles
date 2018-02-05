FROM alpine:3.6

ENV PIP_CERT /tmp/DigiCertHighAssuranceEVRootCA.pem

RUN apk add --update --no-cache \
        build-base \
        python \
        py-pip \
        openssl \
        libffi-dev \
        python-dev \
        curl \
        bash \
    && curl -sO http://cacerts.digicert.com/DigiCertHighAssuranceEVRootCA.crt \
    && openssl x509 -inform DES -in DigiCertHighAssuranceEVRootCA.crt -out /tmp/DigiCertHighAssuranceEVRootCA.pem -text \
    && rm -f DigiCertHighAssuranceEVRootCA.crt

ENTRYPOINT [ "/bin/bash" ]
