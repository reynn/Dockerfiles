FROM alpine:3.7

ENV PIP_CERT /tmp/DigiCertHighAssuranceEVRootCA.pem

RUN apk add --update --no-cache \
        build-base \
        python3 \
        openssl \
        libffi-dev \
        python3-dev \
        curl \
        bash \
    && curl -sO http://cacerts.digicert.com/DigiCertHighAssuranceEVRootCA.crt \
    && openssl x509 -inform DES -in DigiCertHighAssuranceEVRootCA.crt -out /tmp/DigiCertHighAssuranceEVRootCA.pem -text \
    && rm -f DigiCertHighAssuranceEVRootCA.crt \
    && ln -s /usr/bin/pip3 /usr/bin/pip

ENTRYPOINT [ "/bin/bash" ]
