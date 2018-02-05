FROM python-build-base:3.6-alpine

COPY requirements-ansible.txt /tmp/requirements.txt

RUN apk add --update --no-cache \
        openssl-dev \
    && pip install -r /tmp/requirements.txt \
    && apk del openssl-dev

ENTRYPOINT ["/usr/bin/env", "ansible"]
