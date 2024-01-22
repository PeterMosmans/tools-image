# Generic Makefile for Docker images

# Copyright (C) 2018-2024 Peter Mosmans [Go Forward]
# SPDX-License-Identifier: GPL-3.0-or-later

# TAG	!= git tag|tail -1
TAG     = "latest"
NAME	!= basename $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOCKER_IMG := gofwd/$(NAME):$(TAG)


# Recipes that aren't filenames: This ensures that they always will be executed
.PHONY: image test

# Build image
image:
	@echo "Building $(DOCKER_IMG)..." && \
	DOCKER_BUILDKIT=1 docker build . -t $(DOCKER_IMG)

test:
	anchore-cli --version && \
	ansible-lint --version && \
	black --version && \
	curl --version && \
	cyclonedx-py --help && \
	detect-secrets --version && \
	grype --version
	jwt_tool.py -h && \
	nikto.pl -Version && \
	nmap --version && \
	npm outdated --global && \
	pylint --version && \
	sonar-scanner --version && \
	trufflehog --help && \
	yamllint --version
