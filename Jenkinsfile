// This pipeline revolves around building a Docker image:
// - Build: Builds a Docker image
// - Test: Perform basic tests for the image
// - Push: Pushes the image to the registry

pipeline {
    environment { // Environment variables defined for all steps
        TOOLS_IMAGE = "registry.demo.local:5000/tools-image"
    }

    agent any

    stages {
        stage("Build and test image") {
            agent any
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
            agent any
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
