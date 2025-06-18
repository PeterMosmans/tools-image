# tools-image

This repository contains all files necessary to build a Docker image, containing
several security-related tools. The tools can then easily be used in a
Continuous Integration pipeline, by using this image.

Some of the tools are binaries (for example the SonarQube scanner), some are
Python libraries, and some are Node packages.

The accompanying `.gitlab-ci.yml` file can be used to automatically test the
image, using several automated security testing tools.

A prebuilt Docker image can be found on
<https://hub.docker.com/repository/docker/gofwd/tools-image> and downloaded from
docker.io using the tag `gofwd/tools-image`

The following tools are available:

- ansible-lint
- curl
- cyclonedx-py
- detect-secrets
- grype
- jwt_tool.py
- nikto.pl
- nmap
- npm
- pylint
- shcheck.py
- sonar-scanner
- ssh-audit
- testssl.sh
- yamllint
