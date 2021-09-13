# Use a base image to build (and download) the tools on
FROM node:current-bullseye-slim as build

LABEL maintainer="support@go-forward.net"
LABEL vendor="Go Forward"

COPY requirements.txt .

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary binaries
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

# Install wheel first, as that is not installed by default
RUN python3 -m pip install wheel
# Install packages as specified in the requirements.txt file
RUN python3 -m pip install -r requirements.txt

# Download and unzip sonar-scanner-cli
RUN curl -sL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip -o /tmp/scanner.zip && \
    unzip /tmp/scanner.zip -d /tmp/sonarscanner && \
    mv /tmp/sonarscanner/sonar-scanner-4.2.0.1873-linux /usr/lib/sonar-scanner

# Clone nikto.pl
RUN git clone --depth=1 https://github.com/sullo/nikto /tmp/nikto && \
    rm -rf /tmp/nikto/program/.git && \
    mv /tmp/nikto/program /usr/lib/nikto

# Clone testssl.sh
RUN git clone --depth=1 https://github.com/drwetter/testssl.sh /tmp/testssl && \
    mkdir /usr/lib/testssl && \
    mv /tmp/testssl/bin/openssl.Linux.x86_64 /usr/lib/testssl/openssl && \
    chmod ugo+x /usr/lib/testssl/openssl && \
    mv /tmp/testssl/etc/ /usr/lib/testssl/etc/ && \
    mv /tmp/testssl/testssl.sh /usr/lib/testssl/testssl.sh && \
    chmod ugo+x /usr/lib/testssl/testssl.sh

FROM node:current-bullseye-slim as release
COPY --from=build /opt/venv /opt/venv
COPY --from=build /usr/lib/nikto/ /usr/lib/nikto/
COPY --from=build /usr/lib/sonar-scanner/ /usr/lib/sonar-scanner/
COPY --from=build /usr/lib/testssl/ /usr/lib/testssl/
RUN ln -s /usr/lib/nikto/nikto.pl /usr/local/bin/nikto.pl
RUN ln -s /usr/lib/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner
RUN ln -s /usr/lib/testssl/testssl.sh /usr/local/bin/testssl.sh

# Install necessary binaries
RUN apt-get update && apt-get install -y --no-install-recommends\
    bsdmainutils \
    curl \
    dnsutils \
    git \
    libnet-ssleay-perl \
    procps \
    python3 \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Update node package manager
RUN npm install --global npm@latest

ENV PATH="/opt/venv/bin:$PATH"
ENV SONAR_RUNNER_HOME=/usr/lib/sonar-scanner SONAR_USER_HOME=/tmp
ENV LC_ALL=C.UTF-8
ENV ANCHORE_CLI_URL=http://anchore-engine_api_1:8228/v1 ANCHORE_CLI_USER=admin ANCHORE_CLI_PASS=foobar

RUN groupadd -r tool && \
    useradd --create-home --no-log-init --shell /bin/bash --system --gid tool --groups tool,node tool && \
    chown -R tool:tool /opt/venv
USER tool