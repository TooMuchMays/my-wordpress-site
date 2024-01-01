pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/TooMuchMays/my-wordpress-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t mywordpress:v1 .'
                }
            }
        }

        stage('Run WordPress') {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    sh 'docker stop wp_container_test || true'
                    sh 'docker rm wp_container_test || true'

                    // Run the new container with port mapping to 8081
                    sh 'docker run --name wp_container_test -d -p 8081:80 mywordpress:v1'
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    int maxRetries = 5
                    int retryCount = 0
                    boolean success = false

                    while (!success && retryCount < maxRetries) {
                        try {
                            sh 'curl -f http://localhost:8081'
                            success = true
                        } catch (Exception e) {
                            retryCount++
                            echo "Health check failed, retrying in 10 seconds (retry ${retryCount} of ${maxRetries})"
                            sleep time: 10, unit: 'SECONDS'
                        }
                    }

                    if (!success) {
                        error "Health check failed after ${maxRetries} retries."
                    }
                }
            }
        }
    }

    post {
        always {
            script {
                // Stop and remove the container after the build, regardless of success or failure
                sh 'docker stop wp_container_test || true'
                sh 'docker rm wp_container_test || true'
            }
        }
        success {
            echo 'Health check passed. Job is green.'
        }
        failure {
            echo 'Health check failed. Job is red.'
        }
    }
}

