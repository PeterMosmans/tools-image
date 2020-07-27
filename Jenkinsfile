// This pipeline revolves around building a Docker image:
// - Lint: Lints a Dockerfile using hadolint
// - Build and test: Builds and tests a Docker image
// - Push: Pushes the image to the registry

pipeline {
    agent any

    environment { // Environment variables defined for all steps
        TOOLS_IMAGE = "registry.demo.local:5000/tools-image"
    }

    stages {
        stage("Lint") {
            agent {
                docker {
                    image "docker.io/hadolint/hadolint:v1.18.0"
                    reuseNode true
                }
            }
            steps {
                script {
                    def result = sh label: "Lint Dockerfile",
                        script: """\
                            hadolint Dockerfile > hadolint-results.txt
                        """,
                    returnStatus: true
                    if (result > 0) {
                        unstable(message: "Linting issues found")
                    }
                }
            }
        }

        stage("Build and test image") {
            steps {
                script {
                    def image = docker.build("$TOOLS_IMAGE")
                    // Make sure that the user ID exists within the container
                    image.inside("--volume /etc/passwd:/etc/passwd:ro") {
                        sh label: "Test anchore-cli",
                            script: "anchore-cli --version"
                        sh label: "Test curl",
                            script: "curl --version"
                        sh label: "Test detect-secrets",
                            script: "detect-secrets --version"
                        sh label: "Test nikto.pl",
                            script: "nikto.pl -Version"
                        sh label: "Test for outdated global npm packages",
                            script: "npm outdated --global"
                        sh label: "Test sonar-scanner",
                            script: "sonar-scanner --version"
                        sh label: "Test trufflehog",
                            script: "trufflehog --help"
                    }
                }
            }
        }

        stage("Push to registry") {
            steps {
                script {
                    // Use commit tag if it has been tagged
                    tag = sh(returnStdout: true, script: "git tag --contains").trim()
                    if ("$tag" == "") {
                        if ("${BRANCH_NAME}" == "master") {
                           tag = "latest"
                        } else {
                            tag = "${BRANCH_NAME}"
                        }
                    }
                    sh "docker tag $TOOLS_IMAGE $TOOLS_IMAGE:$tag"
                    // By specifying only the image name, all tags will automatically be pushed
                    sh "docker push $TOOLS_IMAGE"
                }
            }
        }
    }
}
