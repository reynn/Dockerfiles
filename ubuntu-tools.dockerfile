FROM ubuntu:17.10

## Normally the run commands would be one but decided to use layer caching instead of reducing layer count.

ARG HELM_VERSION=2.7.0
ARG KUBECTL_VERSION=1.8.3

RUN apt-get update \
    && apt-get install -y \
        wget \
        python3 \
        vim \
        zsh

# Install Kubectl
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /bin/kubectl \
    && chmod +x /bin/kubectl

# Install helm for Kubernetes
RUN wget -q https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -O helm.tar.gz \
    && tar -xvf helm.tar.gz \
    && mv linux-amd64/helm /bin/helm \
    && chmod +x /bin/helm \
    && rm -rf helm.tar.gz linux-amd64

ENTRYPOINT [ "/bin/zsh" ]
