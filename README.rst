###########
tools-image
###########

This repository contains all files necessary to build a Docker image, containing
several security tools. The tools can easily be used in a Continuous Integration
pipeline.

Some of the tools are binaries (for example the SonarQube scanner), some are
Python libraries.

The accompanying ``Jenkinsfile`` can be used to automatically build, test and
push the image using the build and automation server Jenkins.

A prebuilt Docker image can be found on
https://hub.docker.com/repository/docker/gofwd/tools-image and downloaded from
docker.io using the tag ``gofwd/tools-image``


The following tools are available:

+ anchore-cli
+ ansible-lint
+ detect-secrets
+ nikto.pl
+ testssl.sh
+ trufflehog
