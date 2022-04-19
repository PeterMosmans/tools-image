###########
tools-image
###########

This repository contains all files necessary to build a Docker image, containing
several security-related tools. The tools can then easily be used in a
Continuous Integration pipeline, by using this image.

Some of the tools are binaries (for example the SonarQube scanner), some are
Python libraries.

The accompanying ``Jenkinsfile`` can be used to automatically build, test and
push the image using the build and automation server Jenkins.

The accompanying ``.gitlab-ci`` file can be used to automatically test the image
(some parts of the pipeline are not included yet, as they are part of reusable
GitLab CI templates).

A prebuilt Docker image can be found on
https://hub.docker.com/repository/docker/gofwd/tools-image and downloaded from
docker.io using the tag ``gofwd/tools-image``


The following tools are available:

+ anchore-cli
+ ansible-lint
+ black
+ curl
+ detect-secrets
+ cyclonedx-bom
+ nikto.pl
+ npm
+ pylint
+ sonar-scanner
+ testssl.sh
+ trufflehog
+ yamllint
