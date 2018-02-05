FROM ubuntu:16.10

LABEL maintainer="PowerShell Team <powershellteam@hotmail.com>"
LABEL readme.md="https://github.com/PowerShell/PowerShell/blob/master/docker/README.md"
LABEL description="This Dockerfile will install the latest release of PS."

# Setup the locale
ENV LANG en_US.UTF-8
ENV LC_ALL $LANG

# Install dependencies and clean up
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        ca-certificates \
        curl \
        apt-transport-https \
        locales\
    && locale-gen $LANG && update-locale \
    # Import the public repository GPG keys for Microsoft
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    # Register the Microsoft Ubuntu 16.04 repository
    && curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/microsoft.list \
    # Install powershell from Microsoft Repo
    apt-get update \
    && apt-get install -y --no-install-recommends \
        powershell \
    && rm -rf /var/lib/apt/lists/* 

# Use PowerShell as the default shell
ENTRYPOINT ["/usr/bin/env", "powershell"]