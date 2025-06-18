# Generic Makefile for Docker images

# Copyright (C) 2018-2025 Peter Mosmans [Go Forward]
# SPDX-License-Identifier: GPL-3.0-or-later

# TAG	!= git tag|tail -1
TAG     = "latest"
NAME	!= basename $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOCKER_IMG := gofwd/$(NAME):$(TAG)

# Use nice colors in the terminal output
COL_BLUE=\033[1;34m
COL_BOLD=\033[1m
COL_GREEN=\033[32m
COL_RED=\033[0;31m
COL_RESET=\033[0m
COL_YELLOW=\033[0;33m

# Include tool version numbers, to keep them separated
include versions.txt
export

# Recipes that aren't filenames: This ensures that they always will be executed
.PHONY: image test

# Build image
image:
	echo "Building $(DOCKER_IMG)..." && \
	DOCKER_BUILDKIT=1 docker build . -t $(DOCKER_IMG) \
	--build-arg GRYPE=${GRYPE_VERSION} \
	--build-arg JWT_TOOL=${JWT_VERSION} \
	--build-arg NIKTO=${NIKTO_VERSION} \
	--build-arg SCANNER=${SCANNER_VERSION} \
	--build-arg TESTSSL=${TESTSSL_VERSION}

image-python:
	@echo "Building $(DOCKER_IMG)..." && \
	DOCKER_BUILDKIT=1 docker build -f Dockerfile.python . -t gofwd/tools-image:python

test:
	ansible-lint --version && \
	curl --version && \
	cyclonedx-py --help && \
	detect-secrets --version && \
	grype --version
	jwt_tool.py -h && \
	nikto.pl -Version && \
	nmap --version && \
	pylint --version && \
	sonar-scanner --version && \
	ssh-audit --help && \
	yamllint --version

testimage: # Test the versioned Docker image
	@echo -e "Testing ${COL_BOLD}$(DOCKER_IMG)${COL_RESET}..." && \
	docker run -it --workdir / -v ${PWD}/test:/test --rm $(DOCKER_IMG) /bin/bash test/all-tests.sh

