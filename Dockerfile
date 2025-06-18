# SPDX-License-Identifier: GPL-3.0-or-later
# (c) 2022-2025 Peter Mosmans [Go Forward]
# Use a base image to build (and download) the tools on

FROM node:22-bookworm-slim AS build

LABEL maintainer="support@go-forward.net"
LABEL vendor="Go Forward"

WORKDIR /
COPY requirements.txt .

# Versions can be specified as build parameters
ARG GRYPE \
    JWT_TOOL \
    NIKTO \
    SCANNER \
    TESTSSL

ENV DEBIAN_FRONTEND=noninteractive \
    GRYPE=${GRYPE} \
    JWT_TOOL=${JWT_TOOL} \
    NIKTO=${NIKTO} \
    SCANNER=${SCANNER} \
    TESTSSL=${TESTSSL}

# Install necessary binaries
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-venv \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install packages as specified in the requirements.txt file
# hadolint ignore=DL3059
RUN python3 -m pip install -r requirements.txt --no-cache-dir && \
    cyclonedx-py -r --format json --output /opt/venv/sbom.json

# Download and unzip sonar-scanner-cli
RUN curl -sL "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SCANNER}-linux.zip" -o /tmp/scanner.zip && \
    unzip /tmp/scanner.zip -d /tmp/sonarscanner && \
    mv "/tmp/sonarscanner/sonar-scanner-${SCANNER}-linux" /usr/lib/sonar-scanner

# Clone jwt_tool
RUN git clone --depth=1 --branch "${JWT_TOOL}" https://github.com/ticarpi/jwt_tool /tmp/jwt_tool && \
    rm -rf /tmp/jwt_tool/.git && \
    rm -rf /tmp/jwt_tool/.github && \
    rm -f /tmp/jwt_tool/Dockerfile && \
    mv /tmp/jwt_tool /usr/lib/jwt_tool && \
    chmod ugo+x /usr/lib/jwt_tool/jwt_tool.py

# Clone nikto.pl
RUN git clone --depth=1 --branch "${NIKTO}" https://github.com/sullo/nikto /tmp/nikto && \
    rm -rf /tmp/nikto/program/.git && \
    mv /tmp/nikto/program /usr/lib/nikto

# Clone testssl.sh
RUN git clone --depth=1 --branch "${TESTSSL}" https://github.com/drwetter/testssl.sh /tmp/testssl && \
    mkdir /usr/lib/testssl && \
    mv /tmp/testssl/bin/openssl.Linux.x86_64 /usr/lib/testssl/openssl && \
    chmod ugo+x /usr/lib/testssl/openssl && \
    mv /tmp/testssl/etc/ /usr/lib/testssl/etc/ && \
    mv /tmp/testssl/testssl.sh /usr/lib/testssl/testssl.sh && \
    chmod ugo+x /usr/lib/testssl/testssl.sh

# Install Grype
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin "${GRYPE}"

FROM node:22-bookworm-slim AS release
# Default entry point
WORKDIR /workdir
COPY html-table.tmpl /usr/local/lib/html-table.tmpl

COPY --chown=999:999 --from=build /opt/venv /opt/venv
COPY --from=build /usr/lib/jwt_tool/ /usr/lib/jwt_tool/
COPY --from=build /usr/lib/nikto/ /usr/lib/nikto/
COPY --from=build /usr/lib/sonar-scanner/ /usr/lib/sonar-scanner/
COPY --from=build /usr/lib/testssl/ /usr/lib/testssl/
COPY --from=build /usr/local/bin/grype /usr/local/bin/grype
RUN ln -s /usr/lib/jwt_tool/jwt_tool.py /usr/local/bin/jwt_tool.py && \
    ln -s /usr/lib/nikto/nikto.pl /usr/local/bin/nikto.pl && \
    ln -s /usr/lib/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    ln -s /usr/lib/testssl/testssl.sh /usr/local/bin/testssl.sh

# Install necessary binaries
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    bsdmainutils \
    curl \
    dnsutils \
    git \
    jq \
    libnet-ssleay-perl \
    make \
    nmap \
    procps \
    python3 \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Update node package manager and typescript package
# Update packages
RUN npm install --location=global \
    npm@latest \
    typescript@latest \
    @cyclonedx/bom@latest \
    && npm update --global \
    && npm cache clean --force \
    && rm -rf /root/.npm/*

ENV LC_ALL=C.UTF-8 \
    NODE_PATH=/usr/local/lib/node_modules \
    PATH="/opt/venv/bin:$PATH" \
    SONAR_RUNNER_HOME=/usr/lib/sonar-scanner \
    SONAR_USER_HOME=/tmp

RUN groupadd -r tool && \
    useradd --create-home --no-log-init --shell /bin/bash --system --gid tool --groups tool,node tool

USER tool

# Create first-time configuration automatically
RUN /usr/lib/jwt_tool/jwt_tool.py || true
